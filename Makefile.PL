use ExtUtils::MakeMaker;
use Cwd;

WriteMakefile(
  NAME=>'String::Ediff',
  LIBS=>$libs,
  OBJECT=>"st_wrap.o st.o",
  CC=>"gcc",
  LD=>"gcc",
  CCCDLFLAGS => "-fpic",
  CCDLFLAGS => "-rdynamic",
  LDDLFLAGS => "-shared",
  LDFLAGS =>  "",
  OPTIMIZE => "-O2",
  CCFLAGS => "-Dbool=char -DHAS_BOOL -I/usr/local/include",
  );
