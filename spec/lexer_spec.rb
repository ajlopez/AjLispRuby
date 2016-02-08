
require 'ajlisp'

module AjLisp
    RSpec.describe Lexer, "lexer" do
        context "atoms" do
            it "get atom token" do
                source = StringSource.new "atom"
                lexer = Lexer.new source
                token = lexer.nextToken

                expect(token).to_not be_nil
                expect(token.value).to eq("atom")
                expect(token.type).to eq(TokenType::ATOM)
                expect(lexer.nextToken).to be_nil
            end

            it "get atom token with spaces" do
                source = StringSource.new "  atom   "
                lexer = Lexer.new source
                token = lexer.nextToken

                expect(token).to_not be_nil
                expect(token.value).to eq("atom")
                expect(token.type).to eq(TokenType::ATOM)
                expect(lexer.nextToken).to be_nil
            end

            it "get two atoms" do
                source = StringSource.new "foo bar"
                lexer = Lexer.new source
                token = lexer.nextToken

                expect(token).to_not be_nil
                expect(token.value).to eq("foo")
                expect(token.type).to eq(TokenType::ATOM)
                
                token = lexer.nextToken

                expect(token).to_not be_nil
                expect(token.value).to eq("bar")
                expect(token.type).to eq(TokenType::ATOM)

                expect(lexer.nextToken).to be_nil
            end
        end
    end
end