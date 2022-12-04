using Avalonia.Controls;
using KitX_Website_Avalonia.ViewModels;

namespace KitX_Website_Avalonia.Views
{
    public partial class TopBarView : UserControl
    {
        private readonly TopBarViewModel viewModel = new();

        public TopBarView()
        {
            InitializeComponent();

            DataContext = viewModel;
        }
    }
}
