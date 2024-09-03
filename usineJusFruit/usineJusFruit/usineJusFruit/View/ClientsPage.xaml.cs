using usineJusFruit.ViewModel;

namespace usineJusFruit.View;

public partial class ClientsPage : ContentPage
{
    public ClientsPage(ClientsPageViewModel clientsPageVM)
    {
        BindingContext = clientsPageVM;
        InitializeComponent();
    }
}