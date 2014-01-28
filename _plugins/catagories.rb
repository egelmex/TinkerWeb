module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      print(category)
      print("\n")

      category_posts = []
      site.posts.each do |p|
	print(p.data['categories']) if p.data['categories']
        if p.data['categories']
          p.data['categories'].each do |x|
            (category_posts << p) if category.downcase == x.downcase
          end
        end
      end

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
      self.data['posts'] = category_posts.reverse 
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

end
