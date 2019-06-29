class Blog::Create < Trailblazer::Operation
  step Model(Blog, :new)
  step Contract::Build(constant: Blog::Contract::Create)
  step Contract::Validate()
  failure :error!
  step Contract::Persist()

  success :hello_world!

  def hello_world!(options, *)
    # how to get this text in controller
    "Hello, Trailblazer!"
  end

  def error!(options, *)
    options['contract.default'].errors.messages
  end
end
