#!/usr/bin/env perl -w
use strict;
use Test;
BEGIN { plan tests => 5 }

use String::Ediff;

ok(test1(), "SUCCESS", "FAILED test1()");
ok(test2(), "SUCCESS", "FAILED test2()");
ok(test3(), "SUCCESS", "FAILED test3()");
ok(test4(), "SUCCESS", "FAILED test4()");
ok(test5(), "SUCCESS", "FAILED test5()");

sub test1 {
  my $s1 = "hello world";
  my $s2 = "hxello worlyd";

  my $indices = String::Ediff::ediff($s1, $s2);
  if ($indices !~ /^1 10 0 0 2 11 0 0\s*$/) {
    print $indices, "\n";
    return "FAILURE";
  }
  return "SUCCESS";
}

sub test2 {
  my $s1 = "hello world a hello world";
  my $s2 = "hxello worlyd xyz hello";

  my $indices = String::Ediff::ediff($s1, $s2);
  if ($indices !~ /^1 10 0 0 2 11 0 0 13 20 0 0 17 23 0 0\s*$/) {
    print $indices, "\n";
    return "FAILURE";
  }
  return "SUCCESS";
}

sub test3 {
  my $s1 = " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;crit=&gt;'red', emerg=&gt;'red', warning=&gt;&quot;red&quot;);";

  my $s2 = " &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; crit=&gt;'red', emerg=&gt;'red', warning=&gt;&quot;red&quot;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; d=&gt;&quot;blue&quot;, w=&gt;&quot;red&quot;,n=&gt;&quot;green&quot;,
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; i=&gt;'pink',e=&gt;'red',a=&gt;'red',
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; c=&gt;'red');";

  my $indices = String::Ediff::ediff($s1, $s2);
  if ($indices !~ /^0 35 0 0 0 36 0 0 35 95 0 0 35 96 0 0\s*$/) {
    print $indices, "\n";
    return "FAILURE";
  }
  return "SUCCESS";
}

sub test4 {
  my $s1 = "hello work";
  my $s2 = "h  xello
  world";

  my $indices = String::Ediff::ediff($s1, $s2);
  if ($indices !~ /^1 6 0 0 4 11 0 1\s*$/) {
    print $indices, "\n";
    return "FAILURE";
  }
  return "SUCCESS";
}

sub test5 {
  my $s1 = "     int node_idx = find_node(t, ap->m_node_id,  
    
                              t->m_str[ap->m_begin_idx]);  
";
  my $s2 = "     int node_idx = find_node(t, ap->m_node_id, ap_begin_char(t, ap));
  ";

  my $indices = String::Ediff::ediff($s1, $s2);
  if ($indices !~ /^0 85 0 2 0 48 0 0 99 106 2 2 50 57 0 0\s*$/) {
    print $indices, "\n";
    return "FAILURE";
  }
  return "SUCCESS";
}

exit;
