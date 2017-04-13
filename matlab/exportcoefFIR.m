function exportcoefFIR(basename, b, buffername)
% Export des coefficients vers un couple de fichiers .h/.c
% Le format utilis� est Int16
% 
% exportcoefFIR(basename, b, buffername)
%   basename: nom du fichier � utiliser (<basename>.h et <basename>.c)
%   b: coefficients sous la forme d'entiers
%   buffername: nom du tableau � utiliser dans le code C


%% D�claration du tableau dans le .h
fp=fopen([basename,'.h'],'wt');
fprintf(fp,'/* Coeficients du filtre FIR sur 16 bits sign�s */\n');
fprintf(fp,'extern int %s_size;\n',buffername);
fprintf(fp,'extern Int16 %s[%d];\n',buffername,length(b));
fclose(fp);

%% D�finition des coefficients dans le .c
fp=fopen([basename,'.c'],'wt');
fprintf(fp,'/* Coeficients du filtre FIR sur 16 bits sign�s */\n');
fprintf(fp,'/* b0 b1 b2 ... bn */\n');
fprintf(fp,'#include "%s.h";\n\n',basename);
fprintf(fp,'int %s_size=%d;\n',buffername,length(b));
fprintf(fp,'Int16 %s[%d]={',buffername,length(b));
fprintf(fp,'%d',b(1)'); 
for i=2:length(b)
    fprintf(fp,', %d',b(i)'); 
end
fprintf(fp,'};\n');
fclose(fp);
