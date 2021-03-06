require 'spec_helper'

describe 'the mongodb_password function' do
  before do
    Puppet::Parser::Functions.autoloader.loadall
  end

  let(:scope) { PuppetlabsSpec::PuppetInternals.scope }

  it 'exists' do
    expect(Puppet::Parser::Functions.function('mongodb_password')).to eq('function_mongodb_password')
  end

  it 'raises a ParseError if there no arguments' do
    expect { scope.function_mongodb_password([]) }.to(raise_error(Puppet::ParseError))
  end

  it 'raises a ParseError if there is more than 2 arguments' do
    expect { scope.function_mongodb_password(%w[foo bar baz]) }.to(raise_error(Puppet::ParseError))
  end

  it 'converts password into a hash' do
    result = scope.function_mongodb_password(%w[user pass])
    expect(result).to(eq('e0c4a7b97d4db31f5014e9694e567d6b'))
  end
end
