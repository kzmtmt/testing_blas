Dir.mkdir "dat" unless File.exist? "dat"

order = 0
transa = 0
transb = 0
stride = 1
error_check = 0

5.times do
  ["sgemm","dgemm"].each do |prog|
    outfile = "dat/cublas4.2.9_#{`hostname`.chop}_#{prog}_"
    outfile += (order == 0) ? "C" : "R"
    outfile += (transa == 0) ? "N" : "T"
    outfile += (transb == 0) ? "N" : "T"
    outfile += ".txt"
    puts outfile
    max_size = (prog == "dgemm") ? 6144 : 7936
    system "./#{prog} #{order} #{transa} #{transb} #{max_size} #{stride} #{error_check} | tee -a #{outfile}"
  end
end

