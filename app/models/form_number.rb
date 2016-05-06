class FormNumber < ActiveRecord::Base
  def self.get(trsType)
    yymm = Date.today.strftime("%Y%m")
    seq = 1
    formNo = self.find_by trsType: trsType, yymm: yymm
    if formNo
      seq = formNo.seq.to_i + 1
      formNo.update(:seq => seq)
    else
      formNo = FormNumber.create(:trsType=>trsType, :yymm => yymm, :seq => 1)
    end

    result = "#{trsType}#{yymm}#{seq.to_s.rjust(4, '0')}"
  end
end
