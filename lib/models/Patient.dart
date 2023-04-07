/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Patient type in your schema. */
@immutable
class Patient extends Model {
  static const classType = const _PatientModelType();
  final String id;
  final String? _nom;
  final String? _prenom;
  final TemporalDate? _dateNaissance;
  final String? _phoneNumber;
  final String? _quartier;
  final String? _ville;
  final String? _patientImageUrl;
  final String? _patientImageKey;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  PatientModelIdentifier get modelIdentifier {
      return PatientModelIdentifier(
        id: id
      );
  }
  
  String get nom {
    try {
      return _nom!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get prenom {
    try {
      return _prenom!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDate get dateNaissance {
    try {
      return _dateNaissance!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get phoneNumber {
    try {
      return _phoneNumber!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get quartier {
    return _quartier;
  }
  
  String get ville {
    try {
      return _ville!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get patientImageUrl {
    return _patientImageUrl;
  }
  
  String? get patientImageKey {
    return _patientImageKey;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Patient._internal({required this.id, required nom, required prenom, required dateNaissance, required phoneNumber, quartier, required ville, patientImageUrl, patientImageKey, createdAt, updatedAt}): _nom = nom, _prenom = prenom, _dateNaissance = dateNaissance, _phoneNumber = phoneNumber, _quartier = quartier, _ville = ville, _patientImageUrl = patientImageUrl, _patientImageKey = patientImageKey, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Patient({String? id, required String nom, required String prenom, required TemporalDate dateNaissance, required String phoneNumber, String? quartier, required String ville, String? patientImageUrl, String? patientImageKey}) {
    return Patient._internal(
      id: id == null ? UUID.getUUID() : id,
      nom: nom,
      prenom: prenom,
      dateNaissance: dateNaissance,
      phoneNumber: phoneNumber,
      quartier: quartier,
      ville: ville,
      patientImageUrl: patientImageUrl,
      patientImageKey: patientImageKey);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Patient &&
      id == other.id &&
      _nom == other._nom &&
      _prenom == other._prenom &&
      _dateNaissance == other._dateNaissance &&
      _phoneNumber == other._phoneNumber &&
      _quartier == other._quartier &&
      _ville == other._ville &&
      _patientImageUrl == other._patientImageUrl &&
      _patientImageKey == other._patientImageKey;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Patient {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("nom=" + "$_nom" + ", ");
    buffer.write("prenom=" + "$_prenom" + ", ");
    buffer.write("dateNaissance=" + (_dateNaissance != null ? _dateNaissance!.format() : "null") + ", ");
    buffer.write("phoneNumber=" + "$_phoneNumber" + ", ");
    buffer.write("quartier=" + "$_quartier" + ", ");
    buffer.write("ville=" + "$_ville" + ", ");
    buffer.write("patientImageUrl=" + "$_patientImageUrl" + ", ");
    buffer.write("patientImageKey=" + "$_patientImageKey" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Patient copyWith({String? nom, String? prenom, TemporalDate? dateNaissance, String? phoneNumber, String? quartier, String? ville, String? patientImageUrl, String? patientImageKey}) {
    return Patient._internal(
      id: id,
      nom: nom ?? this.nom,
      prenom: prenom ?? this.prenom,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      quartier: quartier ?? this.quartier,
      ville: ville ?? this.ville,
      patientImageUrl: patientImageUrl ?? this.patientImageUrl,
      patientImageKey: patientImageKey ?? this.patientImageKey);
  }
  
  Patient.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _nom = json['nom'],
      _prenom = json['prenom'],
      _dateNaissance = json['dateNaissance'] != null ? TemporalDate.fromString(json['dateNaissance']) : null,
      _phoneNumber = json['phoneNumber'],
      _quartier = json['quartier'],
      _ville = json['ville'],
      _patientImageUrl = json['patientImageUrl'],
      _patientImageKey = json['patientImageKey'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'nom': _nom, 'prenom': _prenom, 'dateNaissance': _dateNaissance?.format(), 'phoneNumber': _phoneNumber, 'quartier': _quartier, 'ville': _ville, 'patientImageUrl': _patientImageUrl, 'patientImageKey': _patientImageKey, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id, 'nom': _nom, 'prenom': _prenom, 'dateNaissance': _dateNaissance, 'phoneNumber': _phoneNumber, 'quartier': _quartier, 'ville': _ville, 'patientImageUrl': _patientImageUrl, 'patientImageKey': _patientImageKey, 'createdAt': _createdAt, 'updatedAt': _updatedAt
  };

  static final QueryModelIdentifier<PatientModelIdentifier> MODEL_IDENTIFIER = QueryModelIdentifier<PatientModelIdentifier>();
  static final QueryField ID = QueryField(fieldName: "id");
  static final QueryField NOM = QueryField(fieldName: "nom");
  static final QueryField PRENOM = QueryField(fieldName: "prenom");
  static final QueryField DATENAISSANCE = QueryField(fieldName: "dateNaissance");
  static final QueryField PHONENUMBER = QueryField(fieldName: "phoneNumber");
  static final QueryField QUARTIER = QueryField(fieldName: "quartier");
  static final QueryField VILLE = QueryField(fieldName: "ville");
  static final QueryField PATIENTIMAGEURL = QueryField(fieldName: "patientImageUrl");
  static final QueryField PATIENTIMAGEKEY = QueryField(fieldName: "patientImageKey");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Patient";
    modelSchemaDefinition.pluralName = "Patients";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.NOM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.PRENOM,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.DATENAISSANCE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.date)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.PHONENUMBER,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.QUARTIER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.VILLE,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.PATIENTIMAGEURL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Patient.PATIENTIMAGEKEY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _PatientModelType extends ModelType<Patient> {
  const _PatientModelType();
  
  @override
  Patient fromJson(Map<String, dynamic> jsonData) {
    return Patient.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'Patient';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [Patient] in your schema.
 */
@immutable
class PatientModelIdentifier implements ModelIdentifier<Patient> {
  final String id;

  /** Create an instance of PatientModelIdentifier using [id] the primary key. */
  const PatientModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'PatientModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is PatientModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}