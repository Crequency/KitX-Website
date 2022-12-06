using Avalonia;
using Avalonia.Animation;
using Avalonia.Animation.Easings;
using Avalonia.Controls;
using Avalonia.Data.Core;
using Avalonia.Styling;
using KitX_Website_Avalonia.ViewModels;
using System;
using System.Collections.ObjectModel;
using System.Reactive.Linq;

namespace KitX_Website_Avalonia.Views
{
    public partial class HomeView : UserControl
    {
        private readonly HomeViewModel viewModel = new();

        public HomeView()
        {
            InitializeComponent();

            DataContext = viewModel;

            InitAnimations();

            ContentPanel.AttachedToVisualTree += (_, _) =>
            {
                ContentBorder.Width = ContentPanel.Width;
                ContentBorder.Height = ContentPanel.Height;
            };

            ContentScrollViewer.ScrollChanged += ContentScrollViewer_ScrollChanged;

            ThisView.SizeChanged += (_, _) =>
            {
                InitAnimations();
            };
        }

        private double _lastPosition = 0;
        private double _cornerSize = 7.5;
        private double _offsetOffset = 100;
        private double _horizontalMargin = 180;
        private double _verticalMargin = 90;

        private void InitDatas()
        {
            _horizontalMargin = ThisView.DesiredSize.Width * 0.15;
            _verticalMargin = ThisView.DesiredSize.Height * 0.075;
        }

        private Animation? _scaleIn;
        private Animation? _scaleIn_corner;
        private Animation? _scaleOut;
        private Animation? _scaleOut_corner;

        private void InitAnimations()
        {
            InitDatas();

            #region 卡片缩小动画

            _scaleIn = new()
            {
                Duration = TimeSpan.Parse("0:0:0.45"),
                FillMode = FillMode.Forward,
                Easing = new CubicEaseOut()
            };
            var kf0_1 = new KeyFrame()
            {
                Cue = new(0)
            };
            kf0_1.Setters.Add(new Setter()
            {
                Property = MarginProperty,
                Value = new Thickness(0)
            });
            var kf1_1 = new KeyFrame()
            {
                Cue = new(1)
            };
            kf1_1.Setters.Add(new Setter()
            {
                Property = MarginProperty,
                Value = new Thickness(_horizontalMargin, -_verticalMargin, _horizontalMargin, _verticalMargin)
            });
            _scaleIn.Children.Add(kf0_1);
            _scaleIn.Children.Add(kf1_1);

            #endregion

            #region 卡片变为圆角动画

            _scaleIn_corner = new()
            {
                Duration = TimeSpan.Parse("0:0:0.45"),
                FillMode = FillMode.Forward,
                Easing = new CubicEaseOut()
            };
            var kf0_1_1 = new KeyFrame()
            {
                Cue = new(0)
            };
            kf0_1_1.Setters.Add(new Setter()
            {
                Property = CornerRadiusProperty,
                Value = new Thickness(0)
            });
            var kf1_1_1 = new KeyFrame()
            {
                Cue = new(1)
            };
            kf1_1_1.Setters.Add(new Setter()
            {
                Property = CornerRadiusProperty,
                Value = new Thickness(_cornerSize)
            });
            _scaleIn_corner.Children.Add(kf0_1_1);
            _scaleIn_corner.Children.Add(kf1_1_1);

            #endregion

            #region 卡片放大动画

            _scaleOut = new()
            {
                Duration = TimeSpan.Parse("0:0:0.45"),
                FillMode = FillMode.Forward,
                Easing = new CubicEaseOut()
            };
            var kf0_2 = new KeyFrame()
            {
                Cue = new(0)
            };
            kf0_2.Setters.Add(new Setter()
            {
                Property = MarginProperty,
                Value = new Thickness(_horizontalMargin, -_verticalMargin, _horizontalMargin, _verticalMargin)
            });
            var kf1_2 = new KeyFrame()
            {
                Cue = new(1)
            };
            kf1_2.Setters.Add(new Setter()
            {
                Property = MarginProperty,
                Value = new Thickness(0)
            });
            _scaleOut.Children.Add(kf0_2);
            _scaleOut.Children.Add(kf1_2);

            #endregion

            #region 卡片变为圆角动画

            _scaleOut_corner = new()
            {
                Duration = TimeSpan.Parse("0:0:0.45"),
                FillMode = FillMode.Forward,
                Easing = new CubicEaseOut()
            };
            var kf0_2_2 = new KeyFrame()
            {
                Cue = new(0)
            };
            kf0_2_2.Setters.Add(new Setter()
            {
                Property = CornerRadiusProperty,
                Value = new Thickness(_cornerSize)
            });
            var kf1_2_2 = new KeyFrame()
            {
                Cue = new(1)
            };
            kf1_2_2.Setters.Add(new Setter()
            {
                Property = CornerRadiusProperty,
                Value = new Thickness(0)
            });
            _scaleIn_corner.Children.Add(kf0_2_2);
            _scaleIn_corner.Children.Add(kf1_2_2);

            #endregion
        }

        private void ContentScrollViewer_ScrollChanged(object? sender, ScrollChangedEventArgs e)
        {
            var consv = (sender as ScrollViewer);
            if (consv != null)
            {
                double calculateOffset = ContentPanel.Height - (consv.Offset.Y - 90);
                double passedPixels = calculateOffset - ThisView.DesiredSize.Height - _offsetOffset;

                if (_scaleIn != null && _scaleOut != null
                    && !_scaleIn.IsAnimating(MarginProperty)
                    && !_scaleOut.IsAnimating(MarginProperty))
                {
                    if (passedPixels < 0 && _lastPosition > 0) BeginContentViewScaleIn();
                    else if (passedPixels > 0 && _lastPosition < 0) BeginContentViewScaleOut();
                    _lastPosition = passedPixels;
                }

                if (viewModel.IsDebug)
                {
                    Offset.Text = $"Offset: {consv?.Offset.X}, {consv?.Offset.Y}";
                    CalculateOffset.Text = $"Calculate Offset: {calculateOffset}";
                    PassedPixels.Text = $"Passed Pixels: {passedPixels}";
                }
            }
        }

        private async void BeginContentViewScaleIn()
        {
            if (_scaleIn != null && _scaleIn_corner != null)
            {
                await _scaleIn.RunAsync(ContentPanel, null);
                //await _scaleIn_corner.RunAsync(ContentBorder, null);
            }
        }

        private async void BeginContentViewScaleOut()
        {
            if (_scaleOut != null && _scaleOut_corner != null)
            {
                await _scaleOut.RunAsync(ContentPanel, null);
                //await _scaleOut_corner.RunAsync(ContentBorder, null);
            }
        }
    }
}
