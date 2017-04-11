
notice:-
write('Welcome to medical expert system'),nl.



%hypothesises

disease(Patient,tuberculosis):-
						symptom(Patient, persistent_cough),
						symptom(Patient, constant_fatigue),
						symptom(Patient, weight_loss),
						symptom(Patient, lack_of_appetite),
						symptom(Patient, fever),
						symptom(Patient, coughing_blood),
						symptom(Patient, night_sweats).

disease(Patient,common_cold):-
						symptom(Patient, cough),
						symptom(Patient, nasal_congestion),
						symptom(Patient, shaking_chills),
						symptom(Patient, watery_eye),
                        symptom(Patient, body_ache),
						symptom(Patient, throat_irritation),
						symptom(Patient, muscle_pain),
						symptom(Patient, lack_of_appetite).

disease(Patient,anaemia):-
						symptom(Patient, dizziness),
						symptom(Patient, tired),
						symptom(Patient, fast_heart_rate),
						symptom(Patient, sensation_of_an_abnormal_heartbeat),
						symptom(Patient, shortness_of_breath),
						symptom(Patient, light-headedness),
						symptom(Patient,  malaise),
						symptom(Patient,  spoon_shaped_nails).

disease(Patient,jaundice):-
						symptom(Patient, yellow_eye),
						symptom(Patient, faitigue),
						symptom(Patient, abdominal_pain),
						symptom(Patient, fever),
						symptom(Patient, weight_loss),
						symptom(Patient, pale_stool),
						symptom(Patient, sore_eyes),
						symptom(Patient, swollen_ankles).

disease(Patient,kidney_failure):-
						symptom(Patient, cloudy_urine),
						symptom(Patient, nausea),
						symptom(Patient, fast_heart_rate),
						symptom(Patient, pain_in_abdomen).


disease(Patient,asthma):-
						symptom(Patient, wheezing),
						symptom(Patient, cough),
						symptom(Patient, chest_tightness),
						symptom(Patient, shortness_of_breath).
disease(Patient,influenza):-
						symptom(Patient, headache),
						symptom(Patient, fever),
						symptom(Patient, shaking_chills),
						symptom(Patient, nasal_congestion),
						symptom(Patient, runny_nose),
						symptom(Patient, sore_throat).

disease(Patient,lung_cancer):-
						symptom(Patient, cough),
						symptom(Patient, fever),
						symptom(Patient, hoarseness),
						symptom(Patient, chest_pain),
						symptom(Patient, wheezing),
						symptom(Patient, weight_loss),
						symptom(Patient, lack_of_appetite),
						symptom(Patient, coughing_blood),
						symptom(Patient, headache),
						symptom(Patient, shortness_of_breath).


/*Ask rules*/

symptom(P, Val):-ask('Does the Patient have',Val).
ask(Obj, Val):-known(Obj, Val, true),!.
ask(Obj, Val):-known(Obj, Val, false),!, fail.
ask(Obj, Val):-nl,write(Obj),write(' '),
			write( Val) , write('?(y/n)'), read(Ans), !,
			((Ans=y, assert(known(Obj, Val, true)));(assert(known(Obj, Val, false)),fail)).

diagnose:-nl,write('Diagnosing a lung disease..........'),nl,disease(symptom,Disease) ,!,nl,
			write('That disease could be '), write(Disease).
diagnose:- nl, write('Sorry,we may not be able to diagnose the desease!!').

start:-notice,repeat, abolish(known/3),dynamic(known/3), retractall(known/3), diagnose,nl,nl, write('Try again ? (y/n)'),read(Resp),\+ Resp=y,
		nl,write('Bye ! Thanks for using this system'),abolish(known,3) .





