// Mc32Debounce.c

// C. HUBER    19/02/2014 Portage sur PIC32MX
//             Attention int1 transform� en uint8
//    Modifications :
//         utilisation stdint et stdbool  10.02.2015 CHR
//
// Fonctions pour la gestion de l'anti-rebond simplifi�e d'un switch
//
//
// Principe : Il est n�cessaire d'appeler cycliquement la fonction DoDebounce
//            pour chaque switch. Suggestion cycle de 1 ms
//
//            Pour la gestion du switch, il y a 3 fonctions � disposition :
//       DebounceGetInput  fourni l'�tat du switch apr�s anti-rebond
//       DebounceIsPressed    true indique que l'on vient de presser la touche
//       DebounceIsReleased   true indique que l'on vient de relacher la touche
//       DebounceClearPressed    annule indication de pression sur la touche
//       DebounceClearReleased   annule indication de relachement de la touche
//
//  Remarques : toute les fonctions utilisent un descripteur de touche
//              un �tat 0 indique une touche press�e
//
//---------------------------------------------------------------------------

#include "Mc32Debounce.h"

// constante comptage stabilit� de l'anti-rebond
const uint8_t MaxDebounceCount = 5;

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
// POUR CHAQUE SWITCH DONT ON VEUT EFFECTUER L'ANTI-REBOND DANS L'APPLICATION.
// IL FAUDRA DEFINIR UNE VARIABLE DU  TYPE S_SwitchDescriptor
//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//
//
// DoDebounce (S_SwitchDescriptor *Descriptor, boolean InputValue)
//              Routine effectuant la gestion de l'anti-rebond d'un switch
//              dont l'adresse de la structure est pass�e en param�tre.
//              La valeur du switch lue sur le port est a passer lors de l'appel
//
// Entr�e: un pointeur sur la structure du switch
//         la valeur du switch lue sur le port
//
// Sortie: la structure mise � jour
//         le bit KeyValue qui donne la valeur du switch apr�s anti-rebond
//         le bit KeyPressed qui est mis � 1 d�s que l'on presse sur le switch
//           ce bit n'est pas resett� par cette fonction mais doit l'�tre par l'application
//           si elle l'utilise.
//         le bit KeyReleased qui est mis � 1 d�s que l'on rel�che sur le switch
//           ce bit n'est pas resett� par cette fonction mais doit l'�tre par l'application
//           si elle l'utilise
//

void DoDebounce (S_SwitchDescriptor *Descriptor, bool InputValue)
{
   bool PrevInputValue;
   s_bits tmp;
   
   tmp = Descriptor->bits;
    
   
   // Traitement selon �tat du m�canisme
   switch (Descriptor->DebounceState)
   {
      case DebounceWaitChange :
      PrevInputValue = tmp.KeyPrevInputValue;
         if ( ! (InputValue == PrevInputValue) ) {
               tmp.KeyPrevInputValue = InputValue;
               Descriptor->DebounceState = DebounceWaitStable;
          }
      break;

      case DebounceWaitStable :
         PrevInputValue = tmp.KeyPrevInputValue;
         if ( InputValue == PrevInputValue )
         {
              Descriptor->DebounceCounter++;
              if (Descriptor->DebounceCounter >= MaxDebounceCount)  {
                  // mise � jour du nouvel �tat
                  tmp.KeyValue = InputValue;
                  if (tmp.KeyValue == 0) {
                     tmp.KeyPressed = 1;
                  } else {
                     tmp.KeyReleased = 1;
                  }
                  Descriptor->DebounceState = DebounceWaitChange;
                  Descriptor->DebounceCounter = 0;
               }
          } else {
            Descriptor->DebounceCounter = 0;
            tmp.KeyPrevInputValue = InputValue;
         }
      break;
   }
   Descriptor->bits = tmp;
 } // end DoDebounce

/********************************************************************************************/
// DebounceInit (S_SwitchDescriptor *pDescriptor) :
//              Routine effectuant l'initialisation de la structure d'un switch
//              dont l'adresse de la structure est pass�e en param�tre.
//
// Entr�e: un pointeur sur la structure du switch
//

void DebounceInit (S_SwitchDescriptor *pDescriptor) {
   pDescriptor->DebounceState     = DebounceWaitChange;   // �tat de l'antirebond
   pDescriptor->DebounceCounter   = 0;
   pDescriptor->bits.KeyPressed        = 0;
   pDescriptor->bits.KeyReleased       = 0;
   pDescriptor->bits.KeyPrevInputValue = 1;
   pDescriptor->bits.KeyValue          = 1;
}

//  DebounceGetInput  fourni l'�tat du switch apr�s anti-rebond
bool DebounceGetInput (S_SwitchDescriptor *pDescriptor) {
   return (pDescriptor->bits.KeyValue);
}

//  DebounceIsPressed    true indique que l'on vient de presser la touche
bool DebounceIsPressed (S_SwitchDescriptor *pDescriptor) {
   return (pDescriptor->bits.KeyPressed);
}

//  DebounceIsReleased   true indique que l'on vient de relacher la touche
bool DebounceIsReleased (S_SwitchDescriptor *pDescriptor) {
   return (pDescriptor->bits.KeyReleased);
}

//  DebounceClearPressed    annule indication de pression sur la touche
void DebounceClearPressed  (S_SwitchDescriptor *pDescriptor) {
   pDescriptor->bits.KeyPressed = 0;
}

//  DebounceClearReleased   annule indication de relachement de la touche
void DebounceClearReleased  (S_SwitchDescriptor *pDescriptor) {
   pDescriptor->bits.KeyReleased = 0;
}
