unit Keyword;

interface
uses Token , Tag ;
 type
    keywords = class(Tokens)
     private

     public
       Spelings :   String ;
       constructor CreateKeyword(Sspeling : String  ;  tag : integer  );
       function getSpelings( ): string  ;

 end ;
var
      kPlus        :  keywords;
      kMinus       :  keywords;
      kOr_op       :  keywords;
      kApostroph   :  keywords;
      kDApostroph  :  keywords;
      kArray       :  keywords;
      kBegin       :  keywords;
      kPoin        :  keywords;
      kCase        :  keywords;
      kString      :  keywords;
      kColon       :  keywords;
      //kColonEqual  :  keywords;
      kcomma       :  keywords;
      kconst       :  keywords;
      kDo          :  keywords;
      kDot         :  keywords;
      kDoubleDot   :  keywords;
      kDownto      :  keywords;
      kElse        :  keywords;
      kEnd         :  keywords;
      kEqual       :  keywords;
      kFor         :  keywords;
      kFunction    :  keywords;
      kGoTo        :  keywords;
      kIf          :  keywords;
      kLabel       :  keywords;
      kLeftSk      :  keywords;
      kLeftBar     :  keywords;
      kLetter      :  keywords;
      kdiv_Op      :  keywords;
      kdivchar_Op  :  keywords;
      kmode_Op     :  keywords;
      kand_Op      :  keywords;
      kMult_Op     :  keywords;
      kNil         :  keywords;
      kNot         :  keywords;
      kOf          :  keywords;
      kPacked      :  keywords;
      kProcedure   :  keywords;
      kProgram     :  keywords;
      kRecord      :  keywords;
      //keq_Op       :  keywords;
      knoteq_Op    :  keywords;
      kLower_Op    :  keywords;
      khighe_Op    :  keywords;
      kLoeq_Op     :  keywords;
      khigeq_Op    :  keywords;
      kin_Op       :  keywords;
      kEqual_Op    :  keywords;
      kRepeat      :  keywords;
      kRightSk     :  keywords;
      kRightBar    :  keywords;
      kSignPlus    :  keywords;   //signed integer
      kSignminus   :  keywords;
      kSemicolon   :  keywords;
      kFile        :  keywords;
      kSet         :  keywords;
      kThen        :  keywords;
      kTo          :  keywords;
      kType        :  keywords;
      kUntil       :  keywords;
      kVar         :  keywords;
      kWhile       :  keywords;
      kWith        :  keywords;
      kleftsk2     :  keywords;
      krightsk2    :  keywords;
      kcommand     :  keywords;

      kerror       :  keywords;
      kbasic_type  :  keywords;
      karray_type  :  keywords;
      kbreak       :  keywords;

      ktrue        :  keywords;
      kfalse       :  keywords;
      kcont        :  keywords;

      kwrite       :  keywords;
      kwriteln     :  keywords;
      kread        :  keywords;
      kreadln      :  keywords;
      Keywo : Keywords ;

implementation


constructor keywords.CreateKeyword( Sspeling : String  ; tag : integer);
begin
   spelings := Sspeling ;   
   //Key     := tag;
   inherited CreateT(tag);
end;


function keywords.getSpelings(): string;
begin
        Result:= Spelings;
end ;

begin
kerror        := keywords.CreateKeyword('Lexical Error',terror);
kPlus         := keywords.CreateKeyword('+',tplus);
kMinus        := keywords.CreateKeyword('-',tminus);
kOr_op        := keywords.CreateKeyword('or',tor_op);
kApostroph    := keywords.CreateKeyword('''',tApostroph);
kDApostroph   := keywords.CreateKeyword('"',tdApostroph);
kArray        := keywords.CreateKeyword('array',tArray);
kBegin        := keywords.CreateKeyword('begin',tBegin);
kPoin         := keywords.CreateKeyword('^',tPoin);
kCase         := keywords.CreateKeyword('case',tCase);
kString       := keywords.CreateKeyword('string',tString);
kColon        := keywords.CreateKeyword(':',tColon);
//kColonEqual := keywords.Create; kColonEqual.CreateKeyword(':=',tColonEqual);
kcomma        := keywords.CreateKeyword(',',tcomma);
kconst        := keywords.CreateKeyword('const',tconst);
//kdigit      := keywords.Create; kdigit.CreateKeyword('',tAdd);
kDo           := keywords.CreateKeyword('do',tDo);
kDot          := keywords.CreateKeyword('.',tDot);
kDoubleDot    := keywords.CreateKeyword('..',tDoubleDot);
kDownto       := keywords.CreateKeyword('downto',tDownto);
kElse         := keywords.CreateKeyword('else',tElse);
kEnd          := keywords.CreateKeyword('end',tEnd);
kEqual        := keywords.CreateKeyword(':=',tEqual);
kFor          := keywords.CreateKeyword('for',tFor);
kFunction     := keywords.CreateKeyword('function',tfunction);
kGoTo         := keywords.CreateKeyword('goto',tGoTo);
//kId  := keywords.Create; kId.CreateKeyword('',tId);
kIf           := keywords.CreateKeyword('if',tIf);
kLabel        := keywords.CreateKeyword('label',tLabel);
kLeftSk       := keywords.CreateKeyword('(',tLeftSk);
kLeftBar      := keywords.CreateKeyword('[',tLeftBar);
//kOr := keywords.Create; kOr.CreateKeyword('or',t);
kMult_Op      := keywords.CreateKeyword('*',tMult_Op);
kcommand      := keywords.CreateKeyword('//',tcommand);
kdivchar_Op   := keywords.CreateKeyword('div',tdivchar_Op);
kmode_Op      := keywords.CreateKeyword('mod',tmode_Op);
kand_Op       := keywords.CreateKeyword('and',tand_Op );
kNil          := keywords.CreateKeyword('nil',tNil);
kNot          := keywords.CreateKeyword('not',tNot);
kOf           := keywords.CreateKeyword('of',tOf);
kPacked       := keywords.CreateKeyword('packed',tPacked);
kProcedure    := keywords.CreateKeyword('procedure',tProcedure);
kProgram      := keywords.CreateKeyword('program',tProgram);
kRecord       := keywords.CreateKeyword('record',tRecord);
//keq_Op        := keywords.CreateKeyword('=',tRelat_Op);
knoteq_Op     := keywords.CreateKeyword('<>',tnotequal_op);
kLower_Op     := keywords.CreateKeyword('<',tlower);
khighe_Op     := keywords.CreateKeyword('>',tbiger);
kLoeq_Op      := keywords.CreateKeyword('<=',tloweeq);
khigeq_Op     := keywords.CreateKeyword('>=',tbigereq);
kEqual_Op     := keywords.CreateKeyword('=',tequal_op);
kin_Op        := keywords.CreateKeyword('in',tin);
kRepeat       := keywords.CreateKeyword('repeat',tRepeat);
kRightSk      := keywords.CreateKeyword(')',tRightSk);
kRightBar     := keywords.CreateKeyword(']',tRightBar);
kSemicolon    := keywords.Create; kSemicolon.CreateKeyword(';',tSemicolon);
kFile         := keywords.CreateKeyword('file',tFile);
kSet          := keywords.CreateKeyword('set',tSet);
kSignPlus     := keywords.CreateKeyword('+',tSignplus);
kSignminus    := keywords.CreateKeyword('-',tSignminus);
kThen         := keywords.CreateKeyword('then',tThen);
kTo           := keywords.CreateKeyword('to',tTo);
kType         := keywords.CreateKeyword('type',tType);
kUntil        := keywords.CreateKeyword('until',tUntil);
kVar          := keywords.CreateKeyword('var',tVar);
kWhile        := keywords.CreateKeyword('while',tWhile);
kWith         := keywords.CreateKeyword('with',tWith);
kleftsk2      := keywords.CreateKeyword('{',tleftsk2);
krightsk2     := keywords.CreateKeyword('}',tRightSk2);

kcont         := keywords.CreateKeyword('const',tconst);
kbreak        := keywords.CreateKeyword('break',tbreak);

ktrue         := keywords.CreateKeyword('true',ttrue);
kfalse        := keywords.CreateKeyword('false',tfalse);

kwrite        := keywords.CreateKeyword('write',twrite);
kwriteln      := keywords.CreateKeyword('writeln',twriteln);
kread         := keywords.CreateKeyword('read',tread);
kreadln       := keywords.CreateKeyword('readln',treadln);





end.
