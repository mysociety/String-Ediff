use ExtUtils::MakeMaker;

my $pod = 'lib/String/Ediff.pod';

WriteMakefile(
  NAME=>'String::Ediff',
  ABSTRACT_FROM=>$pod,
  VERSION=>'0.10',
  OBJECT=>"st_wrap.o st.o",
#  CCFLAGS => "-Dbool=char -DHAS_BOOL -I/usr/local/include",
  AUTHOR=>'Bo Zou',
  LICENSE=>'perl_5',
  (eval { ExtUtils::MakeMaker->VERSION(6.46) } ? (META_MERGE => {
      'meta-spec' => { version => 2 },
      resources => {
          bugtracker => {
              web => "https://github.com/mysociety/String-Ediff/issues",
          },
          homepage => "https://github.com/mysociety/String-Ediff",
          repository => {
              type => 'git',
              url  => 'https://github.com/mysociety/String-Ediff.git',
              web  => 'https://github.com/mysociety/String-Ediff',
          },
      }})
   : ()
  ),
);
