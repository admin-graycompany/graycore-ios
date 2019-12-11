import Foundation
import CPF_CNPJ_Validator

extension String {
	
	public var isValidCNPJ: Bool {
		return BooleanValidator().validate(cnpj: self)
	}
}
