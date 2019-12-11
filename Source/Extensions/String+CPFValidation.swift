import Foundation
import CPF_CNPJ_Validator

extension String {
	
	public var isValidCPF: Bool {
		return BooleanValidator().validate(cpf: self)
	}
}
