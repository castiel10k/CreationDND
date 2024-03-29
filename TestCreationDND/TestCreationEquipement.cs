﻿using NUnit.Framework;
using Model;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace TestCreationDND
{
    public class TestCreationEquipement
    {
        public Models model;

        [SetUp]
        public void Setup()
        {
            model = new Models();
        }

        [Test]
        public void creerEquipementAPartirDEquipementDTO()
        {
            EquipementDTO equipementDTO = new EquipementDTO("Test");

            Equipement equipement = new Equipement(equipementDTO);

            Assert.AreEqual(equipementDTO.nom, equipement.nom);

        }

        [Test]
        public void creerArmeAPartirDArmeDTO()
        {
            ArmeDTO armeDTO = new ArmeDTO("Test", "1d8");

            Arme arme = new Arme(armeDTO);

            Assert.AreEqual(armeDTO.deDeDegats, arme.deDeDegats);

        }

        [Test]
        public void creerArmureAPartirDArmureDTO()
        {
            ArmureDTO armureDTO = new ArmureDTO("Test", 14, true, false, false);

            Armure armure = new Armure(armureDTO);

            Assert.AreEqual(armureDTO.classeArmure, armure.classeArmure);

        }

        [Test]
        public void calculerLaClasseDArmureDUnPersonnagePortantUneArmure()
        {
            Armure armurePortee = new Armure("Armure de cuir", 11, true, false);
            int modDex = 2;

            int classeArmure = armurePortee.calculerClasseArmure(modDex);

            Assert.AreEqual(13, classeArmure);
        }

        [Test]
        public void calculerLaClasseDArmureDUnPersonnagePortantUneArmureAvecUneLimiteSurLeBonusDeDex()
        {
            Armure armurePortee = new Armure("Armure de cuir", 11, true, true);
            int modDex = 5;

            int classeArmure = armurePortee.calculerClasseArmure(modDex);

            Assert.AreEqual(13, classeArmure);
        }

        [Test]
        public void calculerLaClasseDArmureDUnPersonnagePortantUneArmureQuiNAPasLeBonusDeDex()
        {
            Armure armurePortee = new Armure("Armure de cuir", 11, false, false);
            int modDex = 4;

            int classeArmure = armurePortee.calculerClasseArmure(modDex);

            Assert.AreEqual(11, classeArmure);
        }

    }
}
