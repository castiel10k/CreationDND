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

namespace CreationDND
{
    /// <summary>
    /// Lógica interna para InterfaceEquipements.xaml
    /// </summary>
    public partial class InterfaceEquipements : Window
    {
        public InterfaceEquipements()
        {
            InitializeComponent();
        }

        private void btnRetourDePageEquipements_Click(object sender, RoutedEventArgs e)
        {
            InterfaceChoisirCompetence InterfaceCompetences = new InterfaceChoisirCompetence();
            InterfaceCompetences.Show();
            this.Close();
        }
    }
}
