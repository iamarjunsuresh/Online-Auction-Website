namespace :crontask do
  desc "cron for auction system"
  task setliveauction: :environment do
  #@au=Auction.where(:status=>'SCHEDULED' )( :start_time<=Time.now) .where(:end_time>=Time.now)
   #'2017-09-30 23:24:00 UTC'
@au=Auction.where("status=\'SCHEDULED\' and start_time<= :st and end_time >= :st",{st: Time.now.getutc.strftime('%Y/%m/%d %I:%M:%S UTC')})
      @au.each do |t|
            pro=Product.find(t.pid)
            pro.auction_status="AUCTION_LIVE"
            pro.save
            t.status="AUCTION_LIVE"
            t.save
            puts('started auction'+t.id.to_s)

      end

   #   @au=Auction.where(:status=>'AUCTION_LIVE').where( :end_time<Time.now)
    

      @au=Auction.where("status=\'AUCTION_LIVE\' and end_time<= :st",{st: Time.now.getutc.strftime('%Y/%m/%d %I:%M:%S UTC')})
      @au.each do |t|
            t.status="AUCTION_END"
                        pro=Product.find(t.pid)
            pro.auction_status="AUCTION_END"
            pro.save
            
            t.save
            puts('ended auction '+t.id.to_s)
      end



  end
task setwinner: :environment do
  

end

 def getdatefrompicker(datestr)

DateTime.strptime(datestr , "%Y/%m/%d %H:%M")

  end
end
