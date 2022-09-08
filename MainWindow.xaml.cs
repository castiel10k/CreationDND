﻿using System;
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
            dbHandler db = new dbHandler();
            db.InitializeDB();
            //db.showTable("race");
            raceCharacter raceTmp = db.getRace(122);
            raceCharacter raceTmp2 = db.getRace("Nain de montagne");
            List<raceCharacter> listTmp = db.getAllRace();
            //Debug.WriteLine(raceTmp2);
            
        }
    }
}
