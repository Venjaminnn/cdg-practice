require 'pry'

module Resource
  def connection(routes)
    if routes.nil?
      puts "No route matches for #{self}"
      return
    end

    loop do
      print 'Choose verb to interact with resources (GET/POST/PUT/DELETE) / q to exit: '
      verb = gets.chomp
      break if verb == 'q'
   
      action = nil

      if verb == 'GET'
        print 'Choose action (index/show) / q to exit: '
        action = gets.chomp
        break if action == 'q'
      end

      action.nil? ? routes[verb].call : routes[verb][action].call
      
      rescue NoMethodError
        puts 'Wrong option. Select one of the given options.'
    end
  end
end

class PostsController 
  extend Resource
 
  def initialize
    @posts = [{ id: 1, text: 'hello' }, { id: 2, text: 'goodbye' }, { id: 3, text: 'have a nice day' }]
  end
  
  def index
    puts @posts
  end

  def show
    print 'Enter a post ID: '
    id = gets.to_i
    puts @posts.find { |post| post[:id] == id }
  end

  def create
    print 'Enter the text of your post:'
    text = gets.chomp
    new_post = { id: new_id, name: text }
    @posts << new_post 
  end

  def update
    print 'Enter a post ID: '
    id = gets.to_i
    print 'Enter the new text of your post:'
    text = gets.chomp

    @posts = @posts.map do |post|
      change = post[:id] == id
      change ? post.merge(text: text) : post
    end

    pp @posts
  end

  def destroy
    print 'Enter a post ID: '
    id = gets.to_i
    @posts.delete_if { |post| post[:id] == id }
  end
  
  private
  
  def new_id
    @posts.map{ |p| p[:id] }.last + 1
  end
end

class Router
  def initialize
    @routes = {}
  end

  def init
    resources(PostsController, 'posts')

    loop do
      print 'Choose resource you want to interact (1 - Posts, 2 - Comments, q - Exit): '
      choise = gets.chomp

      PostsController.connection(@routes['posts']) if choise == '1'
      puts 'Wrong option. Select one of the given options.' if choise != 1 || choise != q || choise != 2
      break if choise == 'q'
    end

    puts 'Goodbye!'
  end

  def resources(klass, keyword)
    controller = klass.new
    @routes[keyword] = {
      'GET' => {
        'index' => controller.method(:index),
        'show' => controller.method(:show)
      },
      'POST' => controller.method(:create),
      'PUT' => controller.method(:update),
      'DELETE' => controller.method(:destroy)
    }
  end
end

router = Router.new

router.init
