import 'package:go_metro/generated/l10n.dart';

mixin StationNameMixin {
  String? stationName(String station ,
  // BuildContext context
  // S s
  ) {
    // final s = S.of(context);
    final s = S.current;

    switch (station) {
      case "Helwan":
        return s.Helwan;
      case "Ain Helwan":
        return s.Ain_Helwan;

      case "Helwan University":
        return s.Helwan_University;
      case "Wadi Hof":
        return s.Wadi_Hof;
      case "Hadayek Helwan":
        return s.Hadayek_Helwan;
      case "El-Maasara":
        return s.El_Maasara;
      case "Tora El-Asmant":
        return s.Tora_El_Asmant;
      case "Kozzika":
        return s.Kozzika;
      case "Tora El-Balad":
        return s.Tora_El_Balad;
      case "Sakanat El-Maadi":
        return s.Sakanat_El_Maadi;
      case "El-Maadi":
        return s.El_Maadi;
      case "Hadayek El-Maadi":
        return s.Hadayek_El_Maadi;
      case "Dar El-Salam":
        return s.Dar_El_Salam;
      case "El-Zahraa":
        return s.El_Zahraa;
      case "Mar Girgis":
        return s.Mar_Girgis;
      case "El-Malek El-Saleh":
        return s.El_Malek_El_saleh;
      case "El-Sayeda Zeinab":
        return s.El_Sayeda_Zeinab;
      case "Saad Zaghloul":
        return s.Saad_Zaghloul;
      case "El-Sadat":
        return s.El_Sadat;
      case "Nasser":
        return s.Nasser;
      case "Orabi":
        return s.Orabi;
      case "El-Shohadaa":
        return s.El_Shohadaa;
      case "Ghamra":
        return s.Ghamra;
      case "El-Demerdash":
        return s.El_Demerdash;
      case "Manshyet El-Sadr":
        return s.Manshyet_El_Sadr;
      case "Kobry El-Qubba":
        return s.Kobry_El_Qubba;
      case "Hammamet El-Qubba":
        return s.Hammamet_El_Qubba;
      case "Saray El-Qubba":
        return s.Saray_El_Qubba;
      case "Hadayek El-Zaytoun":
        return s.Hadayek_El_Zaytoun;
      case "Helmayet El-Zaytoun":
        return s.Helmayet_El_Zaytoun;
      case "El-Mattareya":
        return s.El_Mattareya;
      case "Ain Shams":
        return s.Ain_Shams;
      case "Ezbet El-Nakhl":
        return s.Ezbet_El_Nakhl;
      case "Al-Marg":
        return s.Al_Marg;
      case "New El-Marg":
        return s.New_El_Marg;

      case "Shubra El-Kheima":
        return s.Shubra_El_Kheima;
      case "Koleyet El-Zeraa":
        return s.Koleyet_El_Zeraa;
      case "El-Mezallat":
        return s.El_Mezallat;
      case "El-Khalafawy":
        return s.El_Khalafawy;
      case "Saint Theresa":
        return s.Saint_Theresa;
      case "Rod El-Farag":
        return s.Rod_El_Farag;
      case "Massara":
        return s.Massara;

      case "Attaba":
        return s.Attaba;
      case "Nageeb":
        return s.Nageeb;

      case "Opera":
        return s.Opera;
      case "Dokki":
        return s.Dokki;
      case "El-Behoos":
        return s.El_Behoos;
      case "Cairo University":
        return s.Cairo_University;
      case "Faysal":
        return s.Faysal;
      case "Giza":
        return s.Giza;
      case "Omm El-Masryeen":
        return s.Omm_El_Masryeen;
      case "Sakyet-Mekky":
        return s.Sakyet_Mekky;
      case "El-Moneeb":
        return s.El_Moneeb;

      case "Adly Mansour":
        return s.Adly_Mansour;
      case "El-Haikstep":
        return s.El_Haikstep;
      case "Omar Ibn El-Khattab":
        return s.Omar_Ibn_El_Khattab;
      case "Qebaa":
        return s.Qebaa;
      case "Hesham Barakat":
        return s.Hesham_Barakat;
      case "Nozha":
        return s.Nozha;
      case "El-Shams Club":
        return s.El_Shams_Club;
      case "Alf Masken":
        return s.Alf_Masken;
      case "Heliopolis":
        return s.Heliopolis;
      case "Haroun":
        return s.Haroun;
      case "El-Ahram":
        return s.El_Ahram;
      case "Kolleyet El-Banat":
        return s.Kolleyet_El_Banat;
      case "Stadium":
        return s.Stadium;

      case "Fair Zone":
        return s.Fair_Zone;
      case "El-Abassiya":
        return s.El_Abassiya;
      case "Abdou Pasha":
        return s.Abdou_Pasha;
      case "El-Geish":
        return s.El_Geish;
      case "Bab El-Shaariya":
        return s.Bab_El_Shaariya;

      case "Maspero":
        return s.Maspero;
      case "Safaa Hegazy":
        return s.Safaa_Hegazy;
      case "Kit-Kat":
        return s.Kit_Kat;
      case "Sudan":
        return s.Sudan;
      case "Imbaba":
        return s.Imbaba;
      case "El-Bohy":
        return s.El_Bohy;
      case "El-Qawmia":
        return s.El_Qawmia;
      case "Ring Road":
        return s.Ring_Road;
      case "Rod El Farag Corr":
        return s.Rod_El_Farag_Corr;
      case "Tawfikia":
        return s.Tawfikia;
      case "Wadi El-Nile":
        return s.Wadi_El_Nile;
      case "Gamet El-Dowel":
        return s.Gamet_El_Dowel;
      case "Boulak El-Dakrour":
        return s.Boulak_El_Dakrour;

      default:
        return null;
    }
  }
}
