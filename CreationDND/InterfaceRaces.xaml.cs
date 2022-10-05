﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using ViewModel;

namespace CreationDND
{
    /// <summary>
    /// Lógica interna para Races.xaml
    /// </summary>
    public partial class Races : Window
    {

        private ViewModels _viewModel;

        public Races()
        {
            InitializeComponent();
            _viewModel = ViewModels.getInstance;
            DataContext = _viewModel;
        }

        private void comboBoxRaces_ChangerImage()
        {

        }

        private void comboBox_AfficherRace(object sender, SelectionChangedEventArgs e)
        {
            if (ComboBox1.SelectedItem != null)
            {
                _viewModel.afficherRace(ComboBox1.SelectedItem);
            }
            //comboBoxRaces_ChangerImage();
        }

        public void chagerPage(object sender, RoutedEventArgs e)
        {
            InterfaceClasses pageClasse = new InterfaceClasses();
            _viewModel.ajouterRace(ComboBox1.SelectedItem);
            pageClasse.Show();
            this.Close();
        }
    }

}
