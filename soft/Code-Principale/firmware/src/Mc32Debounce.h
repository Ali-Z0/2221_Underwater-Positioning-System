#ifndef MC32DEBOUNCE2_H
#define MC32DEBOUNCE2_H


// Mc32Debounce.h

// C. HUBER    19/02/2014 Portage sur PIC32MX
//             Attention int1 transform� en uint8

// Fonctions pour la gestion de l'anti-rebond d'un switch
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

#include <stdbool.h>
#include <stdint.h>

// d�finitions des types qui seront utilis�s dans cette application

// Etats du syst�me antirebond
typedef enum {
      DebounceWaitChange,
      DebounceWaitStable,
} E_DebouceStates;

// New
typedef struct {
   uint8_t  KeyPressed :1;              // �v�nement touche press�e
   uint8_t  KeyReleased : 1;             // �v�nement touche relach�e
   uint8_t  KeyPrevInputValue : 1;       // valeur pr�c�dente de la touche
   uint8_t  KeyValue : 1;                // valeur finale (image) de la touche
 } s_bits;

// structure du descripteur
typedef struct {
           E_DebouceStates DebounceState;    // �tat de l'antirebond
           uint8_t     DebounceCounter;         // compteur
           s_bits bits;
} S_SwitchDescriptor;

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

void DoDebounce (S_SwitchDescriptor *Descriptor, bool InputValue);


/********************************************************************************************/
// DebounceInit (S_SwitchDescriptor *pDescriptor) :
//              Routine effectuant l'initialisation de la structure d'un switch
//              dont l'adresse de la structure est pass�e en param�tre.
//
// Entr�e: un pointeur sur la structure du switch
//

void DebounceInit (S_SwitchDescriptor *pDescriptor);

//  DebounceGetInput  fourni l'�tat du switch apr�s anti-rebond
bool DebounceGetInput (S_SwitchDescriptor *pDescriptor);

//  DebounceIsPressed    true indique que l'on vient de presser la touche
bool DebounceIsPressed (S_SwitchDescriptor *pDescriptor);

//  DebounceIsReleased   true indique que l'on vient de relacher la touche
bool DebounceIsReleased (S_SwitchDescriptor *pDescriptor);

//  DebounceClearPressed    annule indication de pression sur la touche
void DebounceClearPressed  (S_SwitchDescriptor *pDescriptor);

//  DebounceClearReleased   annule indication de relachement de la touche
void DebounceClearReleased  (S_SwitchDescriptor *pDescriptor);

#endif