using CommunityToolkit.Maui;
using Microsoft.Extensions.Logging;
using Microsoft.Data.SqlClient;
using usineJusFruit.Utilities.DataAccess.Files;
using usineJusFruit.Utilities.Interfaces;
using usineJusFruit.Utilities.Services;
using usineJusFruit.View;
using usineJusFruit.ViewModel;
using usineJusFruit.Utilities.DataAccess;
using usineJusFruit.Model.Usine.Calendar;

namespace usineJusFruit
{
    public static class MauiProgram
    {
        private const string CONFIG_FILE = @"C:\Users\kiros\Desktop\POO\MAUI\usineJusFruit\usineJusFruit\usineJusFruit\Configuration\Datas\ConfigCsvUsine.txt";
        
        public static SqlConnection con = new SqlConnection("Server=KIKI\\SQLEXPRESS;Database=Usine;Trusted_Connection=True;TrustServerCertificate=True");
        
        public static MauiApp CreateMauiApp()
        {
            var builder = MauiApp.CreateBuilder();
            builder
                .UseMauiApp<App>()
                .ConfigureFonts(fonts =>
                {
                    fonts.AddFont("OpenSans-Regular.ttf", "OpenSansRegular");
                    fonts.AddFont("OpenSans-Semibold.ttf", "OpenSansSemibold");
                })

            .UseMauiCommunityToolkit();
            DataFilesManager dataFilesManager = new DataFilesManager(CONFIG_FILE);



            builder.Services.AddSingleton<IAlertService>(new AlertServiceDisplay());
            builder.Services.AddSingleton<IDataAccess>(new DataAccessSqlFile(dataFilesManager, new AlertServiceDisplay()));
            // builder.Services.AddSingleton<IDataAccess>(new DataAccessJsonFile(dataFilesManager));
            //permet de faire de l'injection de dépendance dans le constructeur de la MainPage sans devoir faire un new MainPageViewModel() dans celui-ci
            builder.Services.AddTransient<Reservations>();
            builder.Services.AddTransient<ReservationsViewModel>();
            builder.Services.AddTransient<ClientsPage>();
            builder.Services.AddTransient<ClientsPageViewModel>();
            //builder.Services.AddTransient<StaffMembersPageViewModel>();
            //builder.Services.AddTransient<StaffMembersPage>();

#if DEBUG
            builder.Logging.AddDebug();
#endif

            return builder.Build();


            //dependency injection for AlertServiceDisplay  
            AlertServiceDisplay alertService = new AlertServiceDisplay();
            //builder.Services.AddSingleton<IDataAccess>(new DataAccessSql(dataFilesManager, alertService));
        }
    }
}
