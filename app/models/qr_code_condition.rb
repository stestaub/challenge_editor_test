class QrCodeCondition < Condition
  include Mongoid::Document
  field :qr_value, type: String

  after_initialize :set_type

  def set_type
  	self.type = 'Drallo.ChallengeEngine.EventCondition.QRCodeScanCondition, DralloChallengeEngine'
  end

  def as_json
  	super().except("qr_value").merge({"QRValue" => qr_value})
  end
end
