using Avalonia.Controls;
using KitX_Website_Avalonia.ViewModels;

namespace KitX_Website_Avalonia.Views
{
    public partial class HomeView : UserControl
    {
        private readonly HomeViewModel viewModel = new();

        public HomeView()
        {
            InitializeComponent();

            DataContext = viewModel;
        }
    }
}
