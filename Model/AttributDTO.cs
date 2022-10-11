﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class AttributDTO
    {
        public AttributDTO (string nomAttribut, string descriptionAttribut)
        {

            NomAttribut = nomAttribut;
            DescriptionAttribut = descriptionAttribut;


        }

        public string NomAttribut
        {
            get;
            private set;
        }

        public string DescriptionAttribut
        {
            get;
            private set;
        }

    }
}