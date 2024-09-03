//using AndroidX.Emoji2.Text.FlatBuffer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Data.SqlClient;
using usineJusFruit.Model.Production;
using usineJusFruit.Model.Usine.Calendar;
using usineJusFruit.Model.Usine.Payment;
using usineJusFruit.Utilities.DataAccess.Files;
using usineJusFruit.Utilities.Interfaces;
using System.Data;
using usineJusFruit.Model.Usine.People;

namespace usineJusFruit.Utilities.DataAccess
{
    public class DataAccessSqlFile : DataAccess, IDataAccess
    {

        public DataAccessSqlFile(string filePath) : base(filePath)
        {
        }
        /// <summary>
        /// Constructor associated with a datafileManager, it contains path to a config text file
        /// wich contains path to csv files
        /// </summary>
        /// <param name="dfm"></param>
        public DataAccessSqlFile(DataFilesManager dfm, IAlertService alertService) : base(dfm) 
        {
            this.alertService = alertService;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public override TicketsCollection GetAllTickets()
        {
            List<string> listToRead = new List<string>();
            TicketsCollection tickets = new TicketsCollection();
            string? AccessPath = DataFilesManager.DataFiles.GetFilePathByCodeFunction("TICKETS");
            if (IsValidAccessPath)
            {
                listToRead = System.IO.File.ReadAllLines(AccessPath).ToList();
                //remove first title line
                listToRead.RemoveAt(0);
                foreach (string s in listToRead)
                {
                    Ticket t = GetTicket(s);
                    if (t != null)
                    {
                        tickets.AddTicket(t);
                    }
                }
                return tickets;
            }
            else
            {
                //Console.WriteLine("GetAllItems Failes -> File doesnt exist");
                return null;
            }
        }

        private static Ticket GetTicket(string csvline)
        {
            string[] fields = csvline.Split(';');
            if (!string.IsNullOrEmpty(fields[0]))
            {
                Ticket t = new Ticket(idSerial: int.Parse(fields[1]) , totalWeight: int.Parse(fields[1]), litreQuantity: int.Parse(fields[2]), totalPrice: int.Parse(fields[1]));
                return t;
            }
            else
            {
                return null;
            }
        }

        public override FacturesCollection GetAllFactures()
        {
            List<string> listToRead = new List<string>();
            FacturesCollection factures = new FacturesCollection();
            string? AccessPath = DataFilesManager.DataFiles.GetFilePathByCodeFunction("FACTURES");
            if (IsValidAccessPath)
            {
                listToRead = System.IO.File.ReadAllLines(AccessPath).ToList();
                //remove first title line
                listToRead.RemoveAt(0);
                foreach (string s in listToRead)
                {
                    Facture f = GetFacture(s);
                    if (f != null)
                    {
                        factures.AddFacture(f);
                    }
                }
                return factures;
            }
            else
            {
                //Console.WriteLine("GetAllItems Failes -> File doesnt exist");
                return null;
            }
        }
        private static Facture GetFacture(string csvline)
        {
            string[] fields = csvline.Split(';');
            if (!string.IsNullOrEmpty(fields[0]))
            {
                Facture f = new Facture(idSerial: int.Parse(fields[1]), totalWeight: int.Parse(fields[2]), litreQuantity: int.Parse(fields[3]), totalPrice: int.Parse(fields[4]), vatNumber: fields[5]);
                return f;
            }
            else
            {
                return null;
            }
        }



        public override ProductsCollection GetAllProducts()
        {
            List<string> listToRead = new List<string>();
            ProductsCollection products = new ProductsCollection();
            string? AccessPath = DataFilesManager.DataFiles.GetFilePathByCodeFunction("PRODUCTS");
            if (IsValidAccessPath)
            {
                listToRead = System.IO.File.ReadAllLines(AccessPath).ToList();
                //remove first title line
                listToRead.RemoveAt(0);
                foreach (string s in listToRead)
                {
                    Product P = GetProduct(s);
                    if (P != null)
                    {
                        products.AddProduct(P);
                    }
                }
                return products;
            }
            else
            {
                //Console.WriteLine("GetAllItems Failes -> File doesnt exist");
                return null;
            }
        }
 
        private static Product GetProduct(string csvline)
        {
            string[] fields = csvline.Split(';');
            if (!string.IsNullOrEmpty(fields[0]))
            {
                Product p = new Product(id: int.Parse(fields[1]), dateCueillette: DateTime.Parse(fields[2]), variety: fields[3] , quantity: int.Parse(fields[4]), fruit:fields[5]);
                return p;
            }
            else
            {
                return null;
            }
        }

        //public override ReservationsCollection GetAllReservations()
        //{
        //    List<string> listToRead = new List<string>();
        //    ReservationsCollection resrvations = new ReservationsCollection();
        //    string? AccessPath = DataFilesManager.DataFiles.GetFilePathByCodeFunction("RESERVATIONS");
        //    if (IsValidAccessPath)
        //    {
        //        listToRead = System.IO.File.ReadAllLines(AccessPath).ToList();
        //        //remove first title line
        //        listToRead.RemoveAt(0);
        //        foreach (string s in listToRead)
        //        {
        //            Reservation R = GetReservation(s);
        //            if (R != null)
        //            {
        //                resrvations.AddReservation(R);
        //            }
        //        }
        //        return resrvations;
        //    }
        //    else
        //    {
        //        //Console.WriteLine("GetAllItems Failes -> File doesnt exist");
        //        return null;
        //    }
        //}
        //private static Reservation GetReservation(SqlDataReader dr)
        //{
        //    string type = dr.GetValue(1).ToString();
        //    switch (type)
        //    {
        //        case "Reservation":
        //            return new Reservation(id: dr.GetInt32(0), lastName: dr.GetString(2), firstName: dr.GetString(3), gender: dr.GetBoolean(7), email: dr.GetString(6), phone: dr.GetString(5), bankAccount: dr.GetString(8), address: dr.GetString(4), salary: dr.GetDouble(9));
        //        case "Manager":
        //            return new Manager(id: dr.GetInt32(0), lastName: dr.GetString(2), firstName: dr.GetString(3), gender: dr.GetBoolean(7), email: dr.GetString(6), phone: dr.GetString(5), bankAccount: dr.GetString(8), address: dr.GetString(4), salary: dr.GetDouble(9), login: dr.GetString(10), password: dr.GetString(11));
        //        default:
        //            return null;
        //    }
        //}

        private Reservation GetReservation(SqlDataReader Line)
        {
            Client c = null;
            foreach (var oneclient in GetAllClients())
            {
                if (oneclient.Id == Line.GetInt32(6))
                {
                    c = oneclient;
                    break;
                }
            }
            if (c == null) { return null; }//عندما نتعامل مع الفرونت سيظهر لنا صفحة نضيف فيها العميل

            return new Reservation(c, Line.GetInt32(0), Line.GetDateTime(1), Line.GetDateTime(2), Line.GetInt32(4), null, Line.GetInt32(6));
        }

        public override ReservationsCollection GetAllReservations()
        {
            try// تجربة الكود
            {
                ReservationsCollection Reservations = new ReservationsCollection();//محتوي الكل
                string sql = "SELECT * FROM Reservations;";//الامر علي شكل نص

                if (MauiProgram.con.State != ConnectionState.Open)
                    MauiProgram.con.Open();//فتح الاتصال من المتصل الرئيسي (MauiProgram.con)

                SqlCommand cmd = new SqlCommand(sql, MauiProgram.con);//الامر في شكل Class

                SqlDataReader dataReader = cmd.ExecuteReader();//تنفيذ الامر علي هيئة داتا ريدر او قارئ بيانات

                while (dataReader.Read())//قراءة البيانات سطر بعد سطر والانتهاء عند False
                {
                    Reservation sm = GetReservation(dataReader);//احضار كلاس واحد للتخزين
                    if (sm != null)//التاكد من عدم تلفه او فراغه
                    {
                        Reservations.Add(sm);//اضافة علي المجموع الخاص بالكلاس
                    }
                }
                dataReader.Close();//اغلاق قارئ البيانات المستدعي

                MauiProgram.con.Close();// الغاء الاتصال بقاعدة البيانات
                return Reservations;// تمرير المجموعة
            }
            catch (Exception ex)//امساك الاخطاء
            {
                alertService.ShowAlert("Database Request Error", ex.Message);//عرض الاخطاء
                MauiProgram.con.Close();// اغلاق الاتصال بقاعدة البيانات
                return null;// تمرير لا شئ
            }
        }//end GetAllReservations()


        private Client GetClient(SqlDataReader dataReader)
        {
            if (dataReader.GetInt32(0) != 0)
            {
                Client c = new Client(id: dataReader.GetInt32(0), lastName: dataReader.GetString(1), firstName: dataReader.GetString(2), gender: dataReader.GetInt16(3) == 1, email: dataReader.GetString(4), mobilePhoneNumber: dataReader.GetString(5));

               
                    return c;
            }
            else
            {
                return null;
            }

        }

        public override ClientsCollection GetAllClients()
        {
            try// تجربة الكود
            {
                ClientsCollection Clients = new ClientsCollection();//محتوي الكل
                string sql = "SELECT * FROM Clients;";//الامر علي شكل نص

                if (MauiProgram.con.State != ConnectionState.Open)
                    MauiProgram.con.Open();//فتح الاتصال من المتصل الرئيسي (MauiProgram.con)

                SqlCommand cmd = new SqlCommand(sql, MauiProgram.con);//الامر في شكل Class

                SqlDataReader dataReader = cmd.ExecuteReader();//تنفيذ الامر علي هيئة داتا ريدر او قارئ بيانات

                while (dataReader.Read())//قراءة البيانات سطر بعد سطر والانتهاء عند False
                {
                    Client cl = GetClient(dataReader);//احضار كلاس واحد للتخزين
                    if (cl != null)//التاكد من عدم تلفه او فراغه
                    {
                        Clients.Add(cl);//اضافة علي المجموع الخاص بالكلاس
                    }
                }
                dataReader.Close();//اغلاق قارئ البيانات المستدعي

                MauiProgram.con.Close();// الغاء الاتصال بقاعدة البيانات
                return Clients;// تمرير المجموعة
            }
            catch (Exception ex)//امساك الاخطاء
            {
                alertService.ShowAlert("Database Request Error", ex.Message);//عرض الاخطاء
                MauiProgram.con.Close();// اغلاق الاتصال بقاعدة البيانات
                return null;// تمرير لا شئ
            }
        }//end GetAllReservations()


        public override bool UpdateAllReservations(ReservationsCollection Reservations)
        {
            try
            {
                if (MauiProgram.con.State != ConnectionState.Open)
                    MauiProgram.con.Open();

                SqlDataReader Reader = new SqlCommand("Select ID From Clients", MauiProgram.con).ExecuteReader();

                List<int> ExistInts = new List<int>();

                while (Reader.Read())
                {
                    ExistInts.Add(Reader.GetInt32(0));
                }

                Reader.Close();

                foreach (Reservation reservation in Reservations)
                {
                    if (ExistInts.Contains(reservation.ID))
                    {
                        new SqlCommand(GetSqlUpdateReservationMember(reservation), MauiProgram.con).ExecuteNonQuery();
                    }
                    else new SqlCommand(GetSqlInsertReservationMember(reservation), MauiProgram.con).ExecuteNonQuery();
                }

                MauiProgram.con.Close();
            }
            catch (Exception ex)
            {
                alertService.ShowAlert("Database Request Error", ex.Message);
                MauiProgram.con.Close();
            }

            return true;
        }

        private string GetSqlInsertReservationMember(Reservation sm)
        {
            return $"INSERT INTO Clients (Date, DeliveryEffectifDate, EstimatedDate, Quantity, EffectifLitresReceived, ClientID) " +
                $"VALUES ('{sm.Date}','{sm.DeliveryEffectifDate}','{sm.EstimatedDate}','{sm.Quantity}','{sm.EffectifLitresReceived}','{sm.ClientId}');SELECT SCOPE_IDENTITY();";

        }

        private string GetSqlUpdateReservationMember(Reservation sm)
        {
            return $"UPDATE Clients SET Date= '{sm.Date}',DeliveryEffectifDate = '{sm.DeliveryEffectifDate}',EstimatedDate = '{sm.EstimatedDate}',Quantity = '{sm.Quantity}', EffectifLitresReceived = '{sm.EffectifLitresReceived}', ClientId = '{sm.ClientId}' WHERE ID = {sm.ID};";
        }

        public override bool UpdateAllClients(ClientsCollection clients)
        {
            try
            {
                if (MauiProgram.con.State != ConnectionState.Open)
                    MauiProgram.con.Open();

                SqlDataReader Reader = new SqlCommand("Select ID From Clients", MauiProgram.con).ExecuteReader();
                
                List<int> ExistInts = new List<int>();  
                
                while (Reader.Read())
                {
                    ExistInts.Add(Reader.GetInt32(0));
                }

                Reader.Close();

                foreach (Client client in clients)
                {
                    if (ExistInts.Contains(client.Id))
                    {
                        new SqlCommand(GetSqlUpdateClientMember(client), MauiProgram.con).ExecuteNonQuery();
                    }
                    else new SqlCommand(GetSqlInsertClientMember(client), MauiProgram.con).ExecuteNonQuery();
                }

                MauiProgram.con.Close();
            }
            catch (Exception ex) 
            {
                alertService.ShowAlert("Database Request Error", ex.Message);
                MauiProgram.con.Close();
            }

            return true;
        }

        private string GetSqlInsertClientMember(Client sm)
        {
            return $"INSERT INTO Clients (LastName, FirstName, Gender, Email, mobilePhoneNumber) " +
                $"VALUES ('{sm.LastName}','{sm.FirstName}','{(sm.Gender ? "1" : "0")}','{sm.Email}','{sm.MobilePhoneNumber}');SELECT SCOPE_IDENTITY();";

        }

        private string GetSqlUpdateClientMember(Client sm)
        {
            return $"UPDATE Clients SET FirstName= '{sm.FirstName}',LastName = '{sm.LastName}',Gender = '{(sm.Gender ? "1" : "0")}',mobilePhoneNumber = '{sm.MobilePhoneNumber}', Email = '{sm.Email}' WHERE ID = {sm.Id}; ; ";
        }

        private bool IsInDb(int idValue, string idColumnName, string tableName)
        {
            string sql = $"SELECT * FROM {tableName} WHERE {idColumnName} = {idValue}";
            SqlCommand cmd = new SqlCommand(sql, MauiProgram.con);
            SqlDataReader dataReader = cmd.ExecuteReader();
            bool inDb = dataReader.HasRows;
            dataReader.Close();
            return inDb;
        }

        public override ReservationsCollection EnterClientGetReservations(Client client)
        {
            var AllReserv = GetAllReservations();

            var List = new ReservationsCollection();

            var New = AllReserv.Where(x => x.ClientId == client.Id).ToList();

            foreach (var res in New)
            {
                List.Add(res);
            }

            return List;
        }
    }       
}
