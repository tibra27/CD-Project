%{
#include<stdio.h>
#include<string.h>
int in[20];
float fl[20];
char key[100][20];
char id[30][30];
char op[20][10];
int keyword[30]={0};
int a=0,b=0,c=0,d=0,e=0,line=0;
int u,v=0,w=0,x=0,y=0,z=0;
%}

digit [0-9]
alpha [_a-zA-Z]
var [_0-9a-zA-Z]
specialnum [0-9@#$%^&*()-=+!~,./\|]
special [@#$%^&*()-=+!~,/\|]
dot [.]
keywords    int|float|char|if|else|do|break|continue|for|extern|while|goto|long|return|void|switch|auto|case|default|enum|register|sizeof|static|struct|typedef|union|unsigned|double
operators   [-=+*/%><|?~!,^:]

%%
"\n"             {line++;}
#include.*         ;
{specialnum}+{alpha}{var}*		{printf("found error %s in line number: %d\n",yytext,line);}
{specialnum}*{alpha}{var}*+{special}{var}*{special}*	{printf("found error %s in line number: %d\n",yytext,line);}
[+-]?{digit}+               {in[a]=atoi(yytext);a++;}
[+-]?{digit}+{dot}{digit}+      {fl[b]=atof(yytext);b++;}
{keywords}                          {strcpy(key[c],yytext);c++;}
{alpha}{var}*              {strcpy(id[d],yytext);d++;}
{operators}                 {strcpy(op[e],yytext);e++;}
"++"				{strcpy(op[e],yytext);e++;}
"--"				{strcpy(op[e],yytext);e++;}
"&&"				{strcpy(op[e],yytext);e++;}
"||"				{strcpy(op[e],yytext);e++;}
"!="				{strcpy(op[e],yytext);e++;}
"=="				{strcpy(op[e],yytext);e++;}
"("				{strcpy(op[e],yytext);e++;}
"{"				{strcpy(op[e],yytext);e++;}
"["				{strcpy(op[e],yytext);e++;}
"]"				{strcpy(op[e],yytext);e++;}
"}"				{strcpy(op[e],yytext);e++;}
")"				{strcpy(op[e],yytext);e++;}
">>"				{strcpy(op[e],yytext);e++;}
"<<"				{strcpy(op[e],yytext);e++;}
"&"				{strcpy(op[e],yytext);e++;}
"->"				{strcpy(op[e],yytext);e++;}
"."				{strcpy(op[e],yytext);e++;}
\".*\"                      ;
[ \t]+                    ;
\/\/(.*)                ;
.                           ;
%%

int main(int argc,char * argv[])
{
    int i;
    yyin=fopen(argv[1],"r");
    yylex();
  i=0;
	printf("\nTable of token Integers are :\n");
	printf("\t\t\t\t\tInteger\n");
    while(v<a)
    {
            for(i=0;i<v;i++)
            {
              if(in[v]==in[i])
              {
                  break;
              }
            }
            if(i==v)
            {
               printf("\t\t\t\t\t%d\n ",in[v]);
            }
        v++;
    }

    i=0;
	printf("\nTable of token float numbers are :\n");
	printf("\t\t\t\t\tfloat number\n");
    while(w<b)
    {
            for(i=0;i<w;i++)
            {
              if(fl[w]==fl[i])
              {
                  break;
              }
            }
            if(i==w)
            {
               printf("\t\t\t\t\t%f\n ",fl[w]);
            }
        w++;
    }




    i=0;
	printf("\nTable of token Identifiers are :\n");
	printf("\t\t\t\t\tIdentifier\n");
    while(y<d)
    {
            for(i=0;i<y;i++)
            {
              if(strcmp(id[y],id[i])==0)
              {
                  break;
              }
            }
            if(i==y)
            {
                printf("\t\t\t\t\t%s\n",id[y]);
            }
        y++;
    }
    i=0;
	printf("\nTable of token Operators are :\n");
	printf("\t\t\t\t\tOperators\n");
    while(z<e)
    {
            for(i=0;i<z;i++)
            {
              if(strcmp(op[z],op[i])==0)
              {
                  break;
              }
            }
            if(i==z)
            {
                printf("\t\t\t\t\t%s\n ",op[z]);
            }
        z++;
    }
i=0;
	printf("\nTable of token Keywords are :\n");
	printf("\t\t\tKeywords\t\t\tNo. of time used\n");

    while(x<c)
    {
    int count=0;
		if(keyword[x]==0)
		{
		        for(i=x;i<c;i++)
            {
              if(strcmp(key[x],key[i])==0)
              {
                  count++;
		              keyword[i]=1;
              }

            }
		}

      if(count>0)
      {
          printf("\t\t\t%s\t\t\t\t\t%d\n",key[x],count);
      }

        x++;
    }
    fclose(yyin);
}

