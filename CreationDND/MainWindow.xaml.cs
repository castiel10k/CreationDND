﻿
using System;
using System.Collections.Generic;
using System.Diagnostics;
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
using System.Windows.Navigation;
using System.Windows.Shapes;


//using static dbHandler;
//using static raceCharacter;

using System.Windows;

namespace CreationDND
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        
        public MainWindow()
        {
            InitializeComponent();
        }

        void newCharacter(object sender, RoutedEventArgs e)
        {
            Races pageRaces = new Races();
            pageRaces.Show();
            this.Close();
        }

        void viewOldCharacters(object sender, RoutedEventArgs e)
        {
            Personnages pagePersonnages = new Personnages();
            pagePersonnages.Show();
            this.Close();
        }
    }
}
