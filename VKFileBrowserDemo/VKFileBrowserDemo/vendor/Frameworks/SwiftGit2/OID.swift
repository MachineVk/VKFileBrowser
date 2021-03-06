//
//  OID.swift
//  SwiftGit2
//
//  Created by Matt Diephouse on 11/17/14.
//  Copyright (c) 2014 GitHub, Inc. All rights reserved.
//

import Foundation


/// An identifier for a Git object.
public struct OID {

	// MARK: - Initializers

	/// Create an instance from a hex formatted string.
	///
	/// string - A 40-byte hex formatted string.
	public init?(string: String) {
		// libgit2 doesn't enforce a maximum length
		if string.lengthOfBytes(using: String.Encoding.ascii) > 40 {
			return nil
		}

		let pointer = UnsafeMutablePointer<git_oid>.allocate(capacity: 1)
		let result = git_oid_fromstr(pointer, string)

		if result < GIT_OK.rawValue {
			pointer.deallocate(capacity: 1)
			return nil
		}

		oid = pointer.pointee
		pointer.deallocate(capacity: 1)
	}

	/// Create an instance from a libgit2 `git_oid`.
	public init(_ oid: git_oid) {
		self.oid = oid
	}

	// MARK: - Properties

	public let oid: git_oid
}

extension OID: CustomStringConvertible {
	public var description: String {
		let length = Int(GIT_OID_RAWSZ) * 2
		let string = UnsafeMutablePointer<Int8>.allocate(capacity: length)
		var oid = self.oid
		git_oid_fmt(string, &oid)

		return String(bytesNoCopy: string, length: length, encoding: .ascii, freeWhenDone: true)!
	}
}

extension OID: Hashable {
	public var hashValue: Int {
		let bytes = [
			self.oid.id.0,
			self.oid.id.1,
			self.oid.id.2,
			self.oid.id.3,
			self.oid.id.4,
			self.oid.id.5,
			self.oid.id.6,
			self.oid.id.7,
		]
		return bytes.reduce(0) { (hash, byte) in
			return Int(hash << 8) | Int(byte)
		}
	}
}

public func == (lhs: OID, rhs: OID) -> Bool {
	var left = lhs.oid
	var right = rhs.oid
	return git_oid_cmp(&left, &right) == 0
}
