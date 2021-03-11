require 'tmpdir'

class TestCli < Minitest::Test
  EXPECTED_OUTPUT = %Q(first_name,last_name,dob,member_id,effective_date,expiry_date,phone_number
Brent,Wilson,1988-01-01T00:00:00+00:00,349090,2019-09-30T00:00:00+00:00,2000-09-30T00:00:00+00:00,+13038873456
Antonio,Brown,1966-02-02T00:00:00+00:00,890887,2019-09-30T00:00:00+00:00,2000-09-30T00:00:00+00:00,+13033339987
Jerry,Jones,1999-06-06T00:00:00+00:00,jkj3343,2016-08-04T00:00:00+00:00,2050-12-12T00:00:00+00:00,
Baker,Mayfield,1988-01-04T00:00:00+00:00,349093,2019-09-30T00:00:00+00:00,2050-12-13T00:00:00+00:00,+13039873345
Serena,Williams,1948-04-04T00:00:00+00:00,jk 909009,2017-11-11T00:00:00+00:00,2050-12-14T00:00:00+00:00,+14445559876
Jake,Jabs,1988-01-06T00:00:00+00:00,349090,2019-09-30T00:00:00+00:00,1950-12-15T00:00:00+00:00,+14445559877
Mary,Poppins,1988-01-07T00:00:00+00:00,uu 90990,2019-09-30T00:00:00+00:00,1950-12-16T00:00:00+00:00,+14445559878
Sally,Jesse Rephael,1988-01-08T00:00:00+00:00,349097,2019-09-30T00:00:00+00:00,1950-12-17T00:00:00+00:00,+14445559879
Bruce,Springsteen,1988-01-09T00:00:00+00:00,234324,2019-09-30T00:00:00+00:00,,+14445559880
Jason,Statham,1988-02-12T00:00:00+00:00,349099,2019-09-30T00:00:00+00:00,,+16065559886
Lenny,Bruce,1988-01-11T00:00:00+00:00,349100,2019-09-30T00:00:00+00:00,,+12025559882
Martin,Short,1988-01-12T00:00:00+00:00,349101,2019-09-30T00:00:00+00:00,,+14045559883
Benny,Samson,1988-01-13T00:00:00+00:00,349102,2019-09-30T00:00:00+00:00,,+44425559884
)

  EXPECTED_REPORT = %Q(row[2], column[effective_date]: value not present
row[3], column[effective_date]: assuming 20xx from ambiguous year
row[3], column[phone_number]: country code not present, assuming default: 1
row[4], column[effective_date]: assuming 20xx from ambiguous year
row[4], column[phone_number]: country code not present, assuming default: 1
row[5], column[dob]: assuming 19xx from ambiguous year
row[5], column[effective_date]: assuming 20xx from ambiguous year
row[5], column[phone_number]: value not present
row[6], column[dob]: assuming 19xx from ambiguous year
row[6], column[effective_date]: assuming 20xx from ambiguous year
row[7], column[effective_date]: assuming 20xx from ambiguous year
row[7], column[phone_number]: country code not present, assuming default: 1
row[8], column[effective_date]: assuming 20xx from ambiguous year
row[8], column[expiry_date]: assuming 19xx from ambiguous year
row[8], column[phone_number]: country code not present, assuming default: 1
row[9], column[effective_date]: assuming 20xx from ambiguous year
row[9], column[expiry_date]: assuming 19xx from ambiguous year
row[9], column[phone_number]: country code not present, assuming default: 1
row[10], column[dob]: assuming 19xx from ambiguous year
row[10], column[effective_date]: assuming 20xx from ambiguous year
row[10], column[expiry_date]: assuming 19xx from ambiguous year
row[10], column[phone_number]: country code not present, assuming default: 1
row[11], column[dob]: assuming 19xx from ambiguous year
row[11], column[effective_date]: assuming 20xx from ambiguous year
row[11], column[expiry_date]: value not present
row[11], column[phone_number]: country code not present, assuming default: 1
row[12], column[dob]: assuming Y/M/D instead of M/D/Y format
row[12], column[effective_date]: assuming 20xx from ambiguous year
row[12], column[expiry_date]: value not present
row[12], column[phone_number]: country code not present, assuming default: 1
row[13], column[dob]: assuming 19xx from ambiguous year
row[13], column[effective_date]: assuming 20xx from ambiguous year
row[13], column[expiry_date]: value not present
row[13], column[phone_number]: country code not present, assuming default: 1
row[14], column[dob]: assuming 19xx from ambiguous year
row[14], column[effective_date]: assuming 20xx from ambiguous year
row[14], column[expiry_date]: value not present
row[14], column[phone_number]: country code not present, assuming default: 1
row[15], column[dob]: assuming 19xx from ambiguous year
row[15], column[effective_date]: assuming 20xx from ambiguous year
row[15], column[expiry_date]: value not present
)

  def test_generate_output_csv
    Dir.mktmpdir do |dir|
      `bin/cli --out-dir #{dir}`
      assert_equal EXPECTED_OUTPUT, File.read(File.join(dir, 'output.csv'))
      assert_equal EXPECTED_REPORT, File.read(File.join(dir, 'report.txt'))
    end
  end
end
