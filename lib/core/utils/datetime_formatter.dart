import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Classe utilitária para conversão entre String de data e DateTime.
class DateTimeFormatter {
  // Formatos de data
  static const String _formatDdMmYyyyDash = 'dd-MM-yyyy';
  static const String _formatDdMmYyyySlash = 'dd/MM/yyyy';
  // ISO 8601 é tratado nativamente, sem necessidade de string de formato no intl para parse/format

  // Formatadores para os padrões específicos
  static final DateFormat _formatterDdMmYyyyDash = DateFormat(_formatDdMmYyyyDash);
  static final DateFormat _formatterDdMmYyyySlash = DateFormat(_formatDdMmYyyySlash);

  // --- Decodificação (String para DateTime) ---

  /// Decodifica uma string no formato "dd-MM-yyyy" para DateTime.
  /// Retorna null se a string for nula, vazia ou inválida.
  static DateTime? decodeDdMmYyyyDash(String? dateString) {
    if (dateString == null || dateString.trim().isEmpty) {
      return null;
    }
    try {
      return _formatterDdMmYyyyDash.parseStrict(dateString);
    } catch (e) {
      // Lidar com erro de parsing, talvez logar ou retornar null
      debugPrint('Erro ao parsear data "$dateString" no formato $_formatDdMmYyyyDash: $e');
      return null;
    }
  }

  /// Decodifica uma string no formato "dd/MM/yyyy" para DateTime.
  /// Retorna null se a string for nula, vazia ou inválida.
  static DateTime? decodeDdMmYyyySlash(String? dateString) {
    if (dateString == null || dateString.trim().isEmpty) {
      return null;
    }
    try {
      return _formatterDdMmYyyySlash.parseStrict(dateString);
    } catch (e) {
      // Lidar com erro de parsing
      debugPrint('Erro ao parsear data "$dateString" no formato $_formatDdMmYyyySlash: $e');
      return null;
    }
  }

  /// Decodifica uma string no formato ISO 8601 (ex: "YYYY-MM-DD", "YYYY-MM-DDTHH:mm:ss.sssZ") para DateTime.
  /// Retorna null se a string for nula, vazia ou inválida.
  static DateTime? decodeIso8601(String? dateString) {
    if (dateString == null || dateString.trim().isEmpty) {
      return null;
    }
    try {
      // DateTime.parse nativamente suporta ISO 8601
      return DateTime.parse(dateString);
    } catch (e) {
      // Lidar com erro de parsing
      debugPrint('Erro ao parsear data "$dateString" no formato ISO 8601: $e');
      return null;
    }
  }

  /// Tenta decodificar uma string de data, tentando vários formatos comuns.
  /// Retorna null se a string for nula, vazia ou não corresponder a nenhum formato conhecido.
  static DateTime? decodeAuto(String? dateString) {
    if (dateString == null || dateString.trim().isEmpty) {
      return null;
    }
    // Tenta na ordem mais comum ou mais específica primeiro
    DateTime? date = decodeIso8601(dateString); // Tenta ISO 8601
    if (date != null) return date;

    date = decodeDdMmYyyyDash(dateString); // Tenta dd-MM-yyyy
    if (date != null) return date;

    date = decodeDdMmYyyySlash(dateString); // Tenta dd/MM/yyyy
    if (date != null) return date;

    // Se nenhum formato funcionou
    debugPrint('Aviso: Não foi possível decodificar a string de data "$dateString" com formatos conhecidos.');
    return null;
  }


  // --- Encodificação (DateTime para String) ---

  /// Encodifica um DateTime para uma string no formato "dd-MM-yyyy".
  /// Retorna null se o DateTime for nulo.
  static String? encodeDdMmYyyyDash(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return _formatterDdMmYyyyDash.format(dateTime);
  }

  /// Encodifica um DateTime para uma string no formato "dd/MM/yyyy".
  /// Retorna null se o DateTime for nulo.
  static String? encodeDdMmYyyySlash(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    return _formatterDdMmYyyySlash.format(dateTime);
  }

  /// Encodifica um DateTime para uma string no formato ISO 8601.
  /// Retorna null se o DateTime for nulo.
  static String? encodeIso8601(DateTime? dateTime) {
    if (dateTime == null) {
      return null;
    }
    // toIso8601String nativamente formata para ISO 8601
    return dateTime.toIso8601String();
  }

  /// Encodifica um DateTime para uma string no formato padrão "dd/MM/yyyy".
  /// Retorna null se o DateTime for nulo.
  static String? encodeDefault(DateTime? dateTime) {
    return encodeDdMmYyyySlash(dateTime); // Define um padrão, por exemplo, dd/MM/yyyy
  }

  /// Converte uma string no formato "dd-MM-yyyy" para uma string no formato ISO 8601.
  /// Retorna null se a string de entrada for nula, vazia ou não puder ser parseada.
  static String? convertDdMmYyyyDashToIso8601(String? dateString) {
    // Primeiro, decodifica a string "dd-MM-yyyy" para DateTime
    final DateTime? dateTime = decodeDdMmYyyyDash(dateString);

    // Se a decodificação foi bem sucedida, encodifica para ISO 8601
    if (dateTime != null) {
      return encodeIso8601(dateTime);
    }

    // Retorna null se a string original for inválida ou nula
    return null;
  }

  static String? convertDdMmYyyySlashToIso8601(String? dateString) {
    // Primeiro, decodifica a string "dd/MM/yyyy" para DateTime
    final DateTime? dateTime = decodeDdMmYyyySlash(dateString);

    // Se a decodificação foi bem sucedida, encodifica para ISO 8601
    if (dateTime != null) {
      return encodeIso8601(dateTime);
    }

    // Retorna null se a string original for inválida ou nula
    return null;
  }

}