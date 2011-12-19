
def import(path)
  PhysicalHost.all.delete
  PhysicalRack.all.delete

  results = CsvMapper.import(path) do
    start_at_row 2
    [r, u, n, name, type, serial, pdu1, pdu2, obname]
  end

  results.each do |line|
    line.n = 1 if line.n.nil?
    if not (line.name.nil? or line.u.nil?)
      physical_rack = PhysicalRack.find_or_create_by(:index => line.r)
      PhysicalHost.create(:name => line.name, 
                          :type => line.type, 
                          :serial => line.serial, 
                          :pdu1 => line.pdu1, 
                          :pdu2 => line.pdu2,
                          :physical_rack => physical_rack,
                          :u => line.u)
    end
  end
end
