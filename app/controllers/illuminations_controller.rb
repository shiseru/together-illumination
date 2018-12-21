class IlluminationsController < ApplicationController
  def update_db
    # case config['adapter']
    # when 'postgresql'
    #   ActiveRecord::Base.connection.execute('TRUNCATE Illumination')
    # else
    #   # ActiveRecord::Base.connection.execute('DELETE FROM Illumination')
    #
    # end
    # ActiveRecord::Base.connection.execute('TRUNCATE TABLE `Illumination`')
    # fetch illumination in Tokyo city
    if current_user.id == 1 then
      agent = Mechanize.new
      page = agent.get('https://sp.jorudan.co.jp/illumi/tokyo.html')
      elements = page.search('.item h3')

      elements.each do |element|
        illumination = Illumination.new(name: element.inner_text)
        illumination.save
      end
    end
    redirect_back(fallback_location: root_path)
  end
end
