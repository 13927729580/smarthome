/**
 * Copyright (c) 2014,2017 Contributors to the Eclipse Foundation
 *
 * See the NOTICE file(s) distributed with this work for additional
 * information regarding copyright ownership.
 *
 * This program and the accompanying materials are made available under the
 * terms of the Eclipse Public License 2.0 which is available at
 * http://www.eclipse.org/legal/epl-2.0
 *
 * SPDX-License-Identifier: EPL-2.0
 */
/*
* generated by Xtext
*/
package org.eclipse.smarthome.model.ui.labeling

import com.google.inject.Inject

import org.eclipse.emf.edit.ui.provider.AdapterFactoryLabelProvider
import org.eclipse.smarthome.model.items.ModelBinding
import org.eclipse.smarthome.model.items.ModelGroupItem
import org.eclipse.smarthome.model.items.ModelItem
import org.eclipse.smarthome.model.items.ModelNormalItem
import org.eclipse.xtext.ui.label.DefaultEObjectLabelProvider

/**
 * Provides labels for a EObjects.
 * 
 * see http://www.eclipse.org/Xtext/documentation.html#labelProvider
 */

class ItemsLabelProvider extends DefaultEObjectLabelProvider {

	@Inject
	new(AdapterFactoryLabelProvider delegate) {
		super(delegate);
	}

	def protected String text(ModelItem item) {
		if(item instanceof ModelGroupItem) {
			return "Group " + item.getName();
		}
		if(item instanceof ModelNormalItem) {
			val name = item.getName();
			return item.getType() + " " + name;
		}
		return item.getLabel();
	}
	
	def protected String text(ModelBinding binding) {
		return binding.getType();
	}

    def protected String image(ModelItem item) {
		if(item instanceof ModelGroupItem) {
			return "group.png";
		}
		if(item instanceof ModelNormalItem) {
			return item.getType().toLowerCase() + ".png";
		}
		return null;
    }

    def protected String image(ModelBinding binding) {
		return "binding.png";
    }
}
