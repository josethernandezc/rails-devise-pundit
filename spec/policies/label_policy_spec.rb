describe LabelPolicy do
  let (:current_user) { FactoryGirl.build_stubbed :user }
  let (:admin) { FactoryGirl.build_stubbed :user, :admin }

  permissions :index?, :new?, :create?, :edit?, :update?, :destroy? do
    it "prevents label management if not an admin" do
      expect(LabelPolicy).not_to permit(current_user)
    end

    it "allows an admin to manage any label" do
      expect(LabelPolicy).to permit(admin)
    end
  end
end
