require File.expand_path("../spec_helper", __FILE__)

module Danger
  describe Danger::DangerDjangoTranslation do
    it "should be a plugin" do
      expect(Danger::DangerDjangoTranslation.new(nil)).to be_a Danger::Plugin
    end

    describe "with Dangerfile" do
      before do
        @dangerfile = testing_dangerfile
        @my_plugin = @dangerfile.django_translation
      end

      it "Receives plugin instance" do
        expect(@dangerfile.django_translation).to be_truthy
      end

    end
  end
end
