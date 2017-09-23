class ProductController 

   
    def  setauctionlive

      @au=Auction.where(:status=>'SCHEDULED' and :start_time<=Time.now and :end_time>=Time.now)
      @au.each do |t|
            @au.status="AUCTION_LIVE"
      end

      @au=Auction.where(:status=>'AUCTION_LIVE' and :end_time<Time.now)
      @au.each do |t|
            @au.status="AUCTION_END"
      end




    end   
      
      

    def  calculatewinner

        





    end   

end
