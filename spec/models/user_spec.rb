require 'spec_helper'

describe User do

    before  {  @user = User.new(name: "Foobar", last_name: "Foobary", email: "user@example.com", password: "123456", password_confirmation: "123456", city: "Boston", phone: "+380982125652", adress: "ул. Толстого", admin: true) }
    subject { @user }

    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password) }
    it { should respond_to(:city) }
    it { should respond_to(:phone) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:authenticate) }
    it { should respond_to(:admin) }
    it { should be_valid }

    describe "check for admin" do   #  Не зрозуміло чому не відпрацьовує вірно.  Чому дає можливість записати поле admin, якщо в attr_accessible це поле не прописано!!!
        before do 
            @user.save
        end
        specify { expect(@user.admin).to eq nil }
        specify { expect(@user.adress).to eq nil }

    end
    describe "check for empty email" do
        before { @user.email = " " }
    
        it { should_not be_valid}
    end
    describe "dup email" do
        before do 
             user_email_with_dup = @user.dup
             user_email_with_dup.email = @user.email.upcase
             user_email_with_dup.save
        end     
        it { should_not be_valid }
    end
    describe "check if do not match password" do
        before { @user.password_confirmation = "mismatch" }

       it { should_not be_valid }
   end
   describe "check on empty password"  do
        before { @user.password = @user.password_confirmation = " " }
   
        it { should_not be_valid }
   end
   describe "when enter short password" do
        before { @user.password = @user.password_confirmation = "a" * 5 }

        it { should_not be_valid }
   end
   describe "found for email and authenticate of user" do
        before { @user1 = User.create(name: "Foobar2", last_name: "Foobary", email: "user1@example.com", password: "123456", password_confirmation: "123456", city: "Boston", phone: "+380982125652") }

        subject { @user1 }

        let(:found_user) { User.find_by(email: @user1.email) }
        describe "with valid password" do
            it { should == found_user.authenticate(@user1.password) }
        end
        describe "with invalid password" do
            let(:user_with_invalid_password) { found_user.authenticate("mismatch") }
            it { should_not eq user_with_invalid_password }
            specify { expect(user_with_invalid_password).to  be_false }
        end 
   end
end
