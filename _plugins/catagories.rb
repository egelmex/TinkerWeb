module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category, posts)
      @site = site
      @base = base
      @dir = dir
      @posts = posts
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_posts = []
      site.posts.each do |p|
        if p.data['categories']
          p.data['categories'].each do |x|
            (category_posts << p) if category.downcase == x.downcase
          end
        end
      end

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
      self.data['posts'] = @posts 
 
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          i = 1
          posts = site.posts.select { |x| x.data['categories'] and x.data['categories'].map{|e| e.downcase}.include? category.downcase }
          posts.each_slice(5) do |y|
            filename = File.join(dir, category)
            filename = (i == 1 ? filename : File.join(filename, ("/page#{i}")))
            print("---")
	    print(filename)
            print("\n")
            print(posts)
            print("\n")
            site.pages << CategoryPage.new(site, site.source, filename, category, y)
            i = i + 1
	  end
        end
      end
    end
  end

end
