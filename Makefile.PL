use ExtUtils::MakeMaker;
use Cwd;

WriteMakefile(
  NAME=>'String::Ediff',
  'VERSION_FROM'=>'lib/String/Ediff.pm',
  LIBS=>$libs,
  OBJECT=>"st_wrap.o st.o",
  LDDLFLAGS => "-shared",
  OPTIMIZE => "-O2",
  CCFLAGS => "-D_GNU_SOURCE -Dbool=char -DHAS_BOOL -I/usr/local/include",
  );
