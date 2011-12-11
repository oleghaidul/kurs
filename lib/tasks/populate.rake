namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    
    require 'populator'
    require 'faker'
    
    [Category, Manufacturer, Option, Product, Make, Model, Car, News, Movie, Comment, Review].each(&:delete_all)


    Category.populate 10 do |category|
      category.name = Populator.words(2).titleize
      category.description = Populator.sentences(5)

      Product.populate 20 do |product|
        product.name = Populator.words(2).titleize
        product.category_id = category.id
        product.assignment = Populator.words(2).titleize
        product.design = Populator.words(2).titleize
        product.construction = Populator.words(2).titleize
        product.price = 100..10000
        product.description = Populator.sentences(5)
        product.manufacturer_id = 1..10

        Review.populate 10 do |review|
          review.name = Populator.words(3).titleize
          review.body = Populator.sentences(5)
          review.reviewable_type = Product.name
          review.reviewable_id = product.id
          review.user_id = 1..5
        end

      end

    end

    Manufacturer.populate 10 do |m|
      m.name = Populator.words(2).titleize
      m.description = Populator.sentences(5)

      Comment.populate 10 do |comment|
        comment.title = Populator.words(3).titleize
        comment.body = Populator.sentences(5)
        comment.commentable_type = Manufacturer.name
        comment.commentable_id = m.id
        comment.user_id = 1..5
      end

    end

    Movie.populate 30 do |movie|
      movie.name = ["X-MEN", "SPIDER MAN 2", "SPIDER MAN 3", "VALKYRIE", "GLADIATOR", "ICE AGE", 
                    "TRANSFORMERS", "MAGNETO", "KUNG FU PANDA", "EAGLE EYE", "NARNIA", 
                    "ANGELS & DEMONS", "HOUSE", "VACANCY", "MIRRORS", "THE KINGDOM", 
                    "MOTIVES", "PRESTIGE"]
      
      movie.description = Populator.sentences(5)
      movie.genre = ["thriller", "action", "comedy"]
      movie.year = [1999, 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011]
      movie.time = [199, 200, 200, 200, 200, 204, 205, 206, 207, 208, 209, 200, 201]
      movie.distributors = Populator.words(3..5).titleize
      movie.rate = [1, 2, 3, 4, 5]

      Comment.populate 10 do |comment|
        comment.title = Populator.words(3).titleize
        comment.body = Populator.sentences(5)
        comment.commentable_type = Movie.name
        comment.commentable_id = movie.id
        comment.user_id = 1..5
      end

      Review.populate 10 do |review|
        review.name = Populator.words(3).titleize
        review.body = Populator.sentences(5)
        review.reviewable_type = Movie.name
        review.reviewable_id = movie.id
        review.user_id = 1..5
      end

    end

    News.populate 30 do |news|
      news.name = Populator.words(3..10).titleize
      news.body = Populator.sentences(5)
      news.user_id = [1, 2, 3, 4, 5, 6, 7, 8]
      news.news_type = ["local", "world", "business", "sports", 
                        "entertainment", "science", "health", "cars", 
                        "movies", "games"]
      

      Comment.populate 10 do |comment|
        comment.title = Populator.words(3).titleize
        comment.body = Populator.sentences(5)
        comment.commentable_type = News.name
        comment.commentable_id = news.id
        comment.user_id = [1, 2, 3, 4, 5]
      end
    end


    Make.populate 10 do |make|
        make.name = ["Acura", "Volvo", "Volkswagen", "Toyota Truck", "Toyota", "Tesla", "Suzuki", 
                    "Subaru", "Smart", "Scion", "Saab", "Rolls-Royce", "Ram", "Porsche", "Nissan Truck", 
                    "Nissan", "Mitsubishi", "MINI", "Mercury", "Mercedes-Benz", "Mazda", "Maybach", 
                    "Maserati", "Lotus", "Lincoln", "Lexus", "Land Rover", "Lamborghini", "Kia", 
                    "Jeep", "Jaguar", "Infiniti", "Hyundai", "Honda", "GMC Truck", "GMC", 
                    "Freightliner", "Ford Truck", "Ford", "Fiat", "Ferrari", "Dodge Truck", "Dodge", 
                    "Chrysler", "Chevrolet Truck", "Chevrolet", "Cadillac", "Buick", "BMW", 
                    "Bentley", "Audi", "Aston Martin"]
        make.description = Populator.sentences(5)

        Model.populate 10 do |model|
          model.name = Populator.words(1).titleize
          model.make_id = make.id
          model.description = Populator.sentences(5)

          Car.populate 10 do |car|
            car.name = Populator.words(3..5).titleize
            car.model_id = model.id
            car.description = Populator.sentences(5)
            car.car_type = ["new", "used"]
            car.horsepower = [100, 200, 300, 320, 220, 150, 175, 88]
            car.seating_capacity = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
            car.engine = [3, 4, 5, 6, 8, 10, 12]
            car.fuel_type = ["diesel","electric","ethanol","gasoline","hybrid","natural_gas"]
            car.towing_capacity = 20.5000
            car.body_style = ["hatchback","coupe","sedan","truck","suv",
                              "crossover","convertible","van","wagon"]
            car.transmission = ["automatic", "manual"]
            car.drive_type = ["two_wd", "four_wd", "all_wd"]
            car.price = [5000, 10000, 12000, 8000, 6000, 7000]
            car.year = 1980..2011
            car.discount = [0, 0, 0, 0, 0, 0, 0, 0, 20, 0, 0, 0, 10, 0, 0, 0, 0, 50]

            Comment.populate 10 do |comment|
              comment.title = Populator.words(3).titleize
              comment.body = Populator.sentences(5)
              comment.commentable_type = Car.name
              comment.commentable_id = car.id
              comment.user_id = [1, 2, 3, 4, 5]
            end

            Review.populate 10 do |review|
              review.name = Populator.words(3).titleize
              review.body = Populator.sentences(5)
              review.reviewable_type = Car.name
              review.reviewable_id = car.id
              review.user_id = 1..5
            end
          end
        end
      end


  end
end