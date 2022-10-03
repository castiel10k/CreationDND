﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using ViewModel;

namespace CreationDND
{
    /// <summary>
    /// Lógica interna para Races.xaml
    /// </summary>
    public partial class Races : Window { 

        private ViewModels _viewModel;
    
        public Races()
        {
            InitializeComponent();
            _viewModel = ViewModels.Instance;
            DataContext = _viewModel;
        }

        private void comboBox_ChangerImage()
        {

        }

        private void comboBox_AfficherRace(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBox1.SelectedItem != null)
            {
                _viewModel.afficherRace(ComboBox1.SelectedItem);
            }
            //comboBox_ChangerImage();
        }
    }

}
