﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

[assembly:InternalsVisibleTo("TestCreationDND")]

namespace Model
{
    class Race
    {
        private String nom;
        private String description;
        private int bForce;
        private int bDex;
        private int bConst;
        private int bInt;
        private int bSage;
        private int bChar;

        public Race(RaceDTO _race)
        {
            this.nom = _race.nom;
            this.description = _race.description;
            this.bForce = _race.bForce;
            this.bDex = _race.bDex;
            this.bConst = _race.bConst;
            this.bInt = _race.bInt;
            this.bSage = _race.bSage;
            this.bChar = _race.bChar;
        }

        internal bool? comparerARaceDTO(RaceDTO raceDTO)
        {
            if(nom != raceDTO.nom || description != raceDTO.description || bForce != raceDTO.bForce || bDex != raceDTO.bDex || bConst != raceDTO.bConst || bInt != raceDTO.bInt || bSage != raceDTO.bSage || bChar != raceDTO.bChar)
            {
                return false;
            }

            return true;
        }
    }
}
