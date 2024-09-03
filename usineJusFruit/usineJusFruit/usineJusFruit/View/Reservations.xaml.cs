using usineJusFruit.ViewModel;

namespace usineJusFruit.View;

public partial class Reservations : ContentPage
{
	public Reservations(ReservationsViewModel reservationspage)
	{
		BindingContext = reservationspage;
		InitializeComponent();


	}
}