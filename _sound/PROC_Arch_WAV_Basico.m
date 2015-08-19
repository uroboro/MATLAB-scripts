%--------------------------------------------------------------------------
%TP0_FFT: PROCESAMIENTO DE SE?ALES DE AUDIO
%--------------------------------------------------------------------------
close all;
clear;
%%%%%%%UFS_Dial('15#', 0.1);

%==========================================================================
%P1: LECTURA, REPRODUCCION Y VISUALIZACION ARCHIVO WAV
%1) Cargar un archivo .wav y visualizar en pantalla 0.5 seg
%2) Generar un tono puro de 1khz y visualizar en pantalla 10mseg
%3) Almacenar el tono en un archivo .WAV de salida
%==========================================================================
%Lectura del archivo wav
[filename, WAV_Sen, WAV_Fs] = UFS_LoadWav();
%Reproducci?n del archivo WAV
%UFS_PlayWav(filename, WAV_Sen, WAV_Fs);

%Longitug de la se?al
N = length(WAV_Sen);
%Generaci?n del vector temporal para visualizaci?n
t = 0 : 1 / WAV_Fs : (N - 1) * (1 / WAV_Fs);

%Generaci?n de un tono puro de 1Khz
%WAV_Sen1K = UFS_PureTone(1000, t, max(WAV_Sen));
%Almacenamiento del tono puro
%wavwrite(WAV_Sen1K, WAV_Fs, 'Tono Puro 1K.wav');

%Visualizaci?n archivos WAV
[fA fB] = UFS_PhoneFrequenciesForButton('1');
WAV_Sen_1 = UFS_PureTone(fA, t, max(WAV_Sen)) + UFS_PureTone(fB, t, max(WAV_Sen));
UFS_VisWav2(filename, WAV_Fs, t, WAV_Sen, WAV_Sen_1);
%==========================================================================
%P2: ESPECTRO FFT
%1) Calular el espectro de la se?ales adquiridas utilizando FFT 
%==========================================================================

%Aplicaci?n FFT----------------------------------------------------------
%Longitud Vectores
N = length(WAV_Sen);
%Vector de frecuencia discreta
f = -WAV_Fs / 2 : WAV_Fs / N : (WAV_Fs / 2) * (1 - 1 / N);

%Comparaci?n con FFT 
WAV_Esp_FFT = fft(WAV_Sen);
%Ajuste del espectro (la fft lo provee entre 0 y Fs en vez de -Fs/2 a Fs/2)
WAV_Esp_FFT = fftshift(WAV_Esp_FFT);

WAV_Esp_1K = fft(WAV_Sen_1);
%Ajuste del espectro (la fft lo provee entre 0 y Fs en vez de -Fs/2 a Fs/2)
WAV_Esp_1K = fftshift(WAV_Esp_1K);

%Visualizaci?n del espectro (MODULO)
UFS_VisSpec2(WAV_Esp_FFT, WAV_Esp_1K, f);
