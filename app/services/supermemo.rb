class Supermemo
  
  def self.memo(efact, sec, inter)
    upd_interval = evaluation(time_sec(sec), inter)
    upd_factor = e_factor(efact, time_sec(sec))
    { review_date: Date.current + interval(upd_factor, upd_interval),
      efact: upd_factor,
      inter: upd_interval }
  end

  def self.e_factor(efact, qual)
    factor = (efact + (0.1 - (5 - qual) * (0.08 + (5 - qual) * 0.02)))
    factor > 1.3 ? factor : 1.3
  end

  def self.interval(efact, inter)
    case
      when inter == 0 then 0
      when inter == 1 then 1.day
      when inter == 2 then 6.day
      when inter > 2 then (inter - 1) * efact
    end
  end

  def self.evaluation(qual, inter)
    qual > 3 ? inter += 1 : 0
  end

  def self.time_sec(sec)
    case
      when (0..15).cover?(sec.to_i) then 5
      when (16..30).cover?(sec.to_i) then 4
      else 3
    end
  end  

end