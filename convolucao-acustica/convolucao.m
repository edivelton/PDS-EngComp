% Fase 1: Importação dos dados
% Lendo os arquivos de áudio e extraindo as matrizes de dados e suas frequências de amostragem (fs)
[resp_imp, fs_resp_imp] = audioread("resposta-impulso/resposta-impulso.wav");
[entrada, fs_entrada] = audioread("entrada/entrada.wav");

% Fase 2: Conversão para Mono
% Extraindo apenas a primeira coluna das matrizes para operar com vetores 1D
resp_imp = resp_imp(:,1);
entrada = entrada(:,1);

% Fase 3: A Convolução
% Aplicando a resposta ao impulso no áudio de entrada original
audio_conv = conv(entrada, resp_imp);

% Fase 4: Normalização
% Encontrando o pico máximo absoluto do vetor resultante e dividindo o sinal por ele.
% Garante que não haverá distorções quando o áudio de saída for montado.
pico_max = max(abs(audio_conv));
audio_norm = audio_conv / pico_max;

% Fase 5: Exportação
% Salvando o vetor normalizado como um novo arquivo .wav, mantendo o sample rate original
audiowrite("saida/saida_conv.wav", audio_norm, fs_entrada);
