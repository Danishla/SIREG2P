
% Diagnostico de causas de mal funcionamiento de un ventilador
% Utiliza sireg2P18.pl

/***  Las reglas de producción
1 -Si el motor está trancado,  está falto de grasa con FC= 0.9.
2 -Si el motor no arranca y no se calienta,
     el  circuito de alimentación está abierto con  FC= 0.8.
3 -Si el motor no arranca y no se calienta,
el  problema está en el motor FC= 0.2.
4 -Si el motor no arranca y se calienta, sin estar trancado,
el  problema está en el motor FC= 0.8.
5 -Si el motor gira a baja velocidad, sin estar trancado el,   problema está en el motor  FC= 0.8.
6 -Si el motor hace mucho ruido al girar,
  el  problema está en los bujes con   FC= 0.9.
****/

% % Las preguntas
prop(1,'el motor esta trancado',p).
prop(2, 'el motor arranca',p).
prop(3, 'el motor se calienta',p).
prop(4, 'el motor gira a baja veocidad',p).
prop(5, 'el motor hace ruido', p).

% Los objetivos
prop(101, 'el motor esta falto de grasa',i).
prop(102, 'el circ. de alimentación abierto',i).
prop(103, 'el problema esta en el motor',i).
prop(104, 'el problema esta en los bujes',i).

% Las reglas
regla(1,y,[1],101,0.9).
regla(2,y,[-2,-3],102,0.8).
regla(3,y,[-2,-3],103,0.2).
regla(4,y,[-2,3,-1],103,0.8).
regla(5,y,[4,-1],103,0.8).
regla(6,y,[5],104,0.9).

clase(1,objetivos,[101,102,103,104]).

main:- nl, write('IDENTIFICA EL ANIMAL '),
  nl,nl,
repeat,
    write('CONSULTA'),
    borrar_pesos,
    pesos_clase(1,_,Lw),
    nl,nl, write(' RESULTADO'),
    reportar_clase(1,_),
    nl,write(' Otra consulta? [s/n]:  ' ),read(R),
  (R=s -> fail;true),
   nl,nl,write(' FIN '),nl,nl.
   

 
 
   
