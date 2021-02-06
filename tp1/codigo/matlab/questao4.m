%Parâmetros do filtro
wp = 2e3*2*pi; %Frequência de borda da faixa de passagem
ws = 1.35e3*2*pi; %Frequência máxima da faixa de rejeição
Rp = 0.131275390; %Distorção de 1.5% na faixa de passagem
Rs = 53.9794001; %Atenuação de 99.8% na faixa de rejeição

%Projeto do filtro
[N, wp] = ellipord(wp, ws, Rp, Rs, 's'); %Determina a ordem mínima
[num_elip, den_elip] = ellip(N, Rp, Rs, wp, 'high', 's');
elip = tf(num_elip, den_elip);

%Informações
p = pole(elip);
z = zero(elip);

disp('Ordem mínima:');
display(N);
disp('Polos:');
display(p);
disp(' ');
disp('Zeros:');
display(z)
disp(' ');
disp('Função de Transferência:');
display(elip)

%Polos e Zeros
figure();
pzplot(elip);

% Bode
figure();
bode(elip);
grid on;
