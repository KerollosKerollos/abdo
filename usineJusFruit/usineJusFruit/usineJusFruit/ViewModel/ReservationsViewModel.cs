using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using usineJusFruit.Model.Usine.Calendar;
using usineJusFruit.Model.Usine.People;
using usineJusFruit.Utilities.Interfaces;

namespace usineJusFruit.ViewModel
{
    public partial class ReservationsViewModel : BaseViewModel
    {
        public ReservationsViewModel(IDataAccess dataAccessService, IAlertService alertService) : base(alertService)
        {
            dataAccess = dataAccessService;
            Clients = dataAccess.GetAllClients();
        }

        private IDataAccess dataAccess;

        public ClientsCollection Clients { get; set; }

        public ReservationsCollection Reservations { get; set; }

        [ObservableProperty]
        private Client clientSelection;

        [RelayCommand()]
        private void getReservations()
        {
            if (clientSelection != null)
            {
                Reservations = dataAccess.EnterClientGetReservations(clientSelection);

            }
            else Reservations = null;
        }

        [ObservableProperty]
        private Reservation reservationSelection;

        [RelayCommand()]
        public void SaveClientDatas()
        {
            if (dataAccess.UpdateAllClients(Clients))
            {
                alertService.ShowAlert("Sauvegarde", "Les données des clients ont bien été sauvegardées");
            }
            else
            {
                alertService.ShowAlert("Sauvegarde erreur", "Une erreur est survenue lors de la sauvegarde");
            };
        }

        [RelayCommand()]
        public void SaveReservationsDatas()
        {
            if (dataAccess.UpdateAllReservations(Reservations))
            {
                alertService.ShowAlert("Sauvegarde", "Les données de reservation ont bien été sauvegardées");
            }
            else
            {
                alertService.ShowAlert("Sauvegarde erreur", "Une erreur est survenue lors de la sauvegarde");
            };
        }

        [RelayCommand()]
        public void SaveAll()
        {
            SaveClientDatas();
            SaveReservationsDatas();
        }
    }
}
